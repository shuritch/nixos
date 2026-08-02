{ inputs, ... }@args:

let inherit (inputs.nixpkgs) lib;
in lib.foldl (a: b: a // b) { } [
  (import ./colors.nix args)
  (import ./device.nix args)
  (import ./modules.nix args)
  (import ./other.nix args)
  (import ./system.nix args)
]
