{ pkgs, ... }:

let
  desktop = with pkgs; [
    foot
    fuzzel
    swaybg
    xwayland-satellite

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
