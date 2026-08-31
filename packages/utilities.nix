{pkgs, ...}: let
  network = with pkgs; [
    iw
    dig
    traceroute
    ethtool
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
    wev
    fzf
    bat
    tree-sitter
    jq
    btop
    fastfetch
  ];
in {
  home.packages = network ++ hardware ++ cli;
}
