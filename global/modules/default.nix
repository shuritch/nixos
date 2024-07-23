{ inputs, outputs, lib, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  import = [
    inputs.home-manager.nixosModules.home-manager
    ./virtualisation.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./database.nix
    ./packages.nix
    ./xserver.nix
    ./network.nix
    ./locale.nix
    ./sound.nix
    ./fonts.nix
    ./user.nix
    ./gpu.nix
    ./nixvim
  ];

  # package = pkgs.nixVersions.nix_2_22;
  services.fstrim.enable = true; # Drive Cleanup
  registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
  nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  nix = {
    settings = {
      trusted-users = [ "root" ];
      flake-registry = ""; # Disable global flake registry
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      auto-optimise-store = true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "weekly";
    };
  };
}
