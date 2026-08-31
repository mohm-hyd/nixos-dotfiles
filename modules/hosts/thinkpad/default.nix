{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.thinkpad = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      thinkpadConfiguration
      intelDrivers
      development
      thinkpadFanControl
      upower
    ];
  };
}
