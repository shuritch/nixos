{ pkgs, ... }:

let
  storage = builtins.readDir ./data;
  parseName = name: builtins.head (pkgs.lib.splitString "." name);
  script = k: pkgs.writeScriptBin (parseName k) (builtins.readFile ./data/${k});
in pkgs.lib.mapAttrs' (k: _: pkgs.lib.nameValuePair (parseName k) (script k))
storage
