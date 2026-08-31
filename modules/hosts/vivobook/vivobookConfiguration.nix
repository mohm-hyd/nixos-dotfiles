{...}: {
  flake.nixosModules.vivobookConfiguration = {pkgs, ...}: {
    networking = {
      hostName = "vivobook";
    };
  };
}
