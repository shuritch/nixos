{ inputs, outputs, lib, pkgs, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  programs.nix-ld.enable = true; # Patches
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    package = pkgs.nixVersions.nix_2_22; # Make it latest
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    settings = {
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      trusted-users = [ "root" "@wheel" ];
      flake-registry = ""; # Disable global flake registry
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      system-features = [ "kvm" "big-parallel" "nixos-test" ];
      auto-optimise-store = lib.mkDefault true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "weekly";
    };
  };
}
