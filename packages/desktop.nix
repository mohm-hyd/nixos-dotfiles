{ pkgs, ... }:

let
  desktop = with pkgs; [
    alacritty
    fuzzel
    swaybg
    xwayland-satellite
    pkgs.noctalia-shell

    thunar
    zathura
    polkit_gnome

    wl-clipboard
    slurp
  ];
in

{
  home.packages = desktop;
}
