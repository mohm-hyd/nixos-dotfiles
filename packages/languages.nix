{ pkgs, ... }:

let
  cpp = with pkgs; [
    clang-tools
  ];
  Lua = with pkgs; [
    lua
    lua-language-server
  ];
in

{
  home.packages = cpp ++ Lua;
}
