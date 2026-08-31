{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.thinkpadConfiguration = {...}: {
    networking = {
      hostName = "thinkpad";
    };
  };
}
