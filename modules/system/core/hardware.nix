{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.hardware = {
    pkgs,
    self,
    ...
  }: {
    hardware = {
      bluetooth.enable = true;
    };
  };
}
