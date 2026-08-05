{ pkgs, ... }:

let
  desktop = with pkgs; [
    foot
    fuzzel
    swaybg
    xwayland-satellite

    adw-gtk3
    nwg-look
    papirus-icon-theme

    thunar
    zathura
    polkit_gnome

    wl-clipboard
    slurp
  ];
in

{
  home.packages = desktop;

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };


  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };

}
