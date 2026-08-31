{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.locale = {
    pkgs,
    self',
    inputs',
    ...
  }: {
    time.timeZone = "America/Edmonton";
    i18n = {
      defaultLocale = "en_US.UTF-8";
    };
  };
}
