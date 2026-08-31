{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.user = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      zsh
    ];
  in {
    imports = modules;
    users.users.mohm = {
      isNormalUser = true;
      initialPassword = "qwer";
      shell = pkgs.zsh;
      description = "mohm";
      extraGroups = [
        "root"
        "wheel"
      ];
    };
  };
}
