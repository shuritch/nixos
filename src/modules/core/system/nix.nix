{ lib, config, pkgs, inputs, ... }:

let
  inherit (lib) mapAttrs attrValues types filterAttrs;
  flInputs =
    filterAttrs (n: v: (types.isType "flake" v) && (n != "self")) inputs;
in {
  nix = {
    channel.enable = false;
    package = pkgs.nixVersions.nix_2_31;
    nixPath = attrValues (mapAttrs (k: v: "${k}=flake:${v.outPath}") flInputs);
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flInputs // {
      nixpkgs = lib.mkForce { flake = inputs.nixpkgs; };
    };

    # Make builds run with a low priority, keeping the system fast
    # daemonCPUSchedPolicy = "idle"; # other | batch | idle
    # daemonIOSchedClass = "idle"; # other | batch | idle
    # daemonIOSchedPriority = 7; # 0-7

    optimise = {
      automatic = true;
      dates = [ "04:00" ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 3d"; # ? Maybe 7 ?
      dates = "Mon *-*-* 03:00";
    };

    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations auto-allocate-uids recursive-nix
    '';

    settings = {
      build-dir = "/var/tmp";
      max-jobs = "auto";
      connect-timeout = 5;
      log-lines = 30;
      keep-going = true; # Keeps building
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      use-registries = true;
      flake-registry = ""; # Disable global flake registry
      system-features = [ "kvm" "big-parallel" "nixos-test" "recursive-nix" ];
      extra-platforms = config.boot.binfmt.emulatedSystems;
      auto-optimise-store = lib.mkDefault true;
      allow-import-from-derivation = true;
      use-xdg-base-directories = true;
      accept-flake-config = false; # CVE
      http-connections = 50;
      keep-derivations = true;
      keep-outputs = true;
      # use-cgroups = true;
      warn-dirty = false;
      sandbox = true;

      allowed-users = [ "root" "@wheel" config.my.system.admin ];
      trusted-users = [ "root" "@wheel" config.my.system.admin ];

      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "auto-allocate-uids"
        # "cgroups"
        "recursive-nix"
      ];

      extra-experimental-features = [
        # https://docs.lix.systems/manual/lix/nightly/contributing/experimental-features.html
        "nix-command" # enables the nix3 commands
        "flakes" # enables flakes
        "ca-derivations" # allow nix to build derivations
        "auto-allocate-uids" # Allows Nix to automatically pick UIDs for builds
        # "cgroups" # allows Nix to execute builds inside cgroups
        "recursive-nix" # allow nix to call itself
      ];
    };
  };
}
