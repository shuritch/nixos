{ pkgs, ... }:

let
  market = import ./market.nix pkgs;
  native = import ./native.nix pkgs;
in { programs.vscode.extensions = [ ] ++ native ++ market; }
