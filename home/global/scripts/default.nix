{ pkgs, lib, ... }:

with lib;

let
  parseName = name: builtins.head (splitString "." name);
  readFile = k: builtins.readFile (path.append ./. k);
  script = k: pkgs.writeScriptBin (parseName k) (readFile k);
in { home.packages = mapAttrsToList (k: _: script k) (builtins.readDir ./.); }
