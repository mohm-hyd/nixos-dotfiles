{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #Editor
    neovim

    #Nix development
    nil
    nixpkgs-fmt
    alejandra

    #General Dev Tools
    tmux
    gcc
    gdb
    gnumake
    nodejs
  ];
}
