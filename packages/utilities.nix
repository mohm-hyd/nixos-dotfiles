{ pkgs, ... }:
let
  network = with pkgs; [
    iw
    dig
    traceroute
  ];
  hardware = with pkgs; [
    pciutils
    usbutils
  ];

  cli = with pkgs; [
    ripgrep
    tree
    libnotify
    fd
    fzf
    bat
    jq
    btop
    fastfetch
  ];
in

{
  home.packages = network ++ hardware ++ cli;
}
