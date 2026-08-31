{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tokyonightGtk = {
    pkgs,
    lib,
    ...
  }: let
    themeVariant = "red";
    borderVariant = "B";
    themeName = "Tokyonight-${themeVariant}-${borderVariant}";
  in {
    environment.systemPackages = with pkgs; [
      (tokyonight-gtk-theme.override {
        themeVariants = [(lib.toLower themeVariant)];
        tweakVariants = ["black"];
      })
      (catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      })
    ];
    programs = {
      xfconf.enable = true;
      dconf = {
        enable = true;
        profiles.user.databases = [
          {
            lockAll = false;
            settings = {
              "org/gnome/desktop/interface" = {
                gtk-theme = themeName;
                icon-theme = "Papirus";
                color-scheme = "prefer-dark";
              };
            };
          }
        ];
      };
    };
  };
}
