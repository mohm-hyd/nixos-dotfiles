{
  moduleWithSystem,
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri-noctalia = moduleWithSystem ({
    self',
    pkgs,
    inputs',
    ...
  }: {config, ...}: let
    modules = with self.nixosModules; [
      audio
      systemTheme
    ];

    runtimePkgs = self'.packages.niri-noctalia.passthru.runtimePackages;
    lib = pkgs.lib;

    runtimeTarget = name: pkg:
      if config.security.wrappers ? ${name}
      then "/run/wrappers/bin/${name}"
      else lib.getExe pkg;
  in {
    imports = modules;
    programs.niri = {
      enable = true;
      package = self'.packages.niri-noctalia;
    };

    services.displayManager.defaultSession = "niri";
    services.xserver.enable = true;
    security.polkit.enable = true;

    environment.systemPackages = with pkgs; [
      gsettings-desktop-schemas
    ];

    system.activationScripts.niriRuntimeEnv = lib.stringAfter ["specialfs"] ''
      mkdir -p /run/niri-runtime-env/bin
      ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: pkg: ''
          ln -sfn ${runtimeTarget name pkg} /run/niri-runtime-env/bin/${name}
        '')
        runtimePkgs)}
    '';

    system.activationScripts.niriConfig = lib.stringAfter ["specialfs"] ''
      mkdir -p /run/niri/config
      ln -sfn ${inputs'.niri-noctalia.packages.repo-files}/* /run/niri/config
    '';
  });
  perSystem = {
    self',
    system,
    inputs',
    ...
  }: {
    packages = {
      niri-noctalia = inputs'.niri-noctalia.packages.default.override {
        flags."--config" = "/run/niri/config/config.kdl";
        env."MODULES_ROOT" = "/run/niri/config/modules";
        runtimePackages =
          inputs.niri-noctalia.lib.defaultRuntimePkgs.${system}
          // {
            foot = self'.packages.foot;
          };
      };
    };
  };
}
