{
  config,
  pkgs,
  inputs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    noctalia = "noctalia";
    nvim = "nvim";
    foot = "foot";
    tmux = "tmux";
    fuzzel = "fuzzel";
  };
in {
  imports = [
    inputs.noctalia.homeModules.default

    ./packages/desktop.nix
    ./packages/development.nix
    ./packages/languages.nix
    ./packages/utilities.nix

    ./services/desktop.nix
  ];

  home.username = "mohm";
  home.homeDirectory = "/home/mohm";
  programs.git.enable = true;
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-vivo";
      nv = "nvim ~/nixos-dotfiles/.";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      neofetch = "fastfetch -c examples/13";
    };
    initExtra = ''
      export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
    '';
  };

  programs.noctalia.enable = true;

  xdg.configFile =
    builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "inode/directory" = "thunar.desktop";
    };
  };
}
