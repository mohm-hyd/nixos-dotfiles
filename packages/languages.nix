{pkgs, ...}: let
  cpp = with pkgs; [
    clang-tools
  ];
  Bash = with pkgs; [
    shellcheck
    bash-language-server
    shfmt
  ];
  Go = with pkgs; [
    go
    gopls
  ];
  Python = with pkgs; [
    python3
  ];
  Lua = with pkgs; [
    lua
    lua-language-server
  ];
in {
  home.packages = cpp ++ Lua ++ Bash ++ Go ++ Python;
}
