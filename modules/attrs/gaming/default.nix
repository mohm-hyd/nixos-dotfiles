{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.gaming = moduleWithSystem (
    {
      pkgs,
      lib,
      unfreePkgs,
      ...
    }: let
      modules = with self.nixosModules; [
        #steam
      ];
    in {
      imports = modules;

      services.flatpak.enable = true;

      environment.systemPackages = with pkgs; [
        unfreePkgs.discord
        prismlauncher
      ];
    }
  );
}
