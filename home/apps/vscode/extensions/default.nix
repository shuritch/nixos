{ pkgs, ... }@input:

let
  market = import ./market.nix input;
  native = import ./native.nix input;
  custom = import ./custom input;
in { programs.vscode.extensions = [ ] ++ native ++ market ++ custom; }
