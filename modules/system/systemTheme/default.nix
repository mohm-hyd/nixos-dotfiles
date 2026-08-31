{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.systemTheme = {
    config,
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      bibataCursors
      tokyonightGtk
    ];
  in {
    imports = modules;
  };
}
