{ pkgs, ... }:

let
  desktop = with pkgs; [
    alacritty
    fuzzel
    swaybg
    xwayland-satellite
    pkgs.noctalia-shell
  ];
in

{
  home.packages = desktop;
}
