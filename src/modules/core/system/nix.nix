{ inputs, lib, pkgs, config, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  nix = {
    # https://git.lix.systems/lix-project/lix/src/branch/main/doc/manual/rl-next
    # https://docs.lix.systems/manual/lix/nightly/release-notes/rl-next.html
    package = pkgs.nixVersions.nix_2_24; # pkgs.nixVersions.nix_2_22 / lix
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    # Make builds run with a low priority, keeping the system fast
    daemonCPUSchedPolicy = "idle"; # other | batch | idle
    daemonIOSchedClass = "idle"; # other | batch | idle
    daemonIOSchedPriority = 7; # 0-7

    optimise = {
      automatic = true;
      dates = [ "04:00" ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 3d"; # ? Maybe 7 ?
      dates = "weekly";
    };

    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations auto-allocate-uids recursive-nix
    '';

    settings = {
      max-jobs = "auto";
      connect-timeout = 5;
      log-lines = 30;
      keep-going = true; # Keeps building
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      flake-registry = ""; # Disable global flake registry
      trusted-users = [ "root" "@wheel" config.my.system.admin ];
      system-features = [ "kvm" "big-parallel" "nixos-test" "recursive-nix" ];
      extra-platforms = config.boot.binfmt.emulatedSystems;
      auto-optimise-store = lib.mkDefault true;
      use-xdg-base-directories = false;
      accept-flake-config = false; # CVE
      http-connections = 50;
      keep-derivations = true;
      keep-outputs = true;
      # use-cgroups = true;
      warn-dirty = false;

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
