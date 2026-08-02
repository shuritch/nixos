{ self, ... }:

let
in {
  imports = [
    # keep-sorted start
    ./activation.nix
    ./cache.nix
    ./documentation.nix
    ./environment.nix
    ./fonts.nix
    ./journal.nix
    ./locale.nix
    ./nix.nix
    ./nixpkgs.nix
    ./oomd.nix
    ./runners.nix
    ./scheduler.nix
    ./shell.nix
    ./systemd.nix
    ./users.nix
    # keep-sorted end
  ];

  config.system = {
    configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
    autoUpgrade.enable = false; # Disable random reboots
    autoUpgrade.allowReboot = false; # Disable random reboots
  };
}
