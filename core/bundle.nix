{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./users/admin.nix
    ./bootloader.nix
    ./fish.nix
    ./kdeconnect.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./security.nix
    ./xserver.nix
  ];
}
