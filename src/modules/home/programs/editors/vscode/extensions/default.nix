{ pkgs, ... }@input:

let
  custom = import ./custom input;
  market = import ./market.nix pkgs;
  native = import ./native.nix pkgs;
in native ++ market ++ custom
