{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #Editor
    neovim

    #Nix development
    nil
    nixpkgs-fmt

    #General Dev Tools
    tmux
    gcc
    gdb
    gnumake
    nodejs
  ];
}
