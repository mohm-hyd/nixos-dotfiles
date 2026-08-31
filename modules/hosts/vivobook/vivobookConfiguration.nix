{...}: {
  flake.nixosModules.vivobookConfiguration = {pkgs, ...}: {
    networking = {
      hostName = "nixos-vivo";
    };
  };
}
