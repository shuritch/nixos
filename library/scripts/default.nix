{ pkgs ? import <nixpkgs> { }, ... }:

let new = name: pkgs.writeScriptBin name (builtins.readfile ./data/${name}.sh);
in { keybinds-menu = new "keybinds-menu"; }
