{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos-vivo = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      vivobookConfiguration
      amdDrivers
      development
      gaming
      sddm-autologin
      nix-ld
    ];
  };
}
