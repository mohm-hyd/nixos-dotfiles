{ pkgs, ... }:

let
  cpp = with pkgs; [
    clang-tools
  ];
  lua = with pkgs; [
    lua-language-server
  ];
in

{
  home.packages = cpp ++ lua;
}
