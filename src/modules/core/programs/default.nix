{ lib, pkgs, ... }: {
  imports = [ ./nh.nix ./shell.nix ./graphical.nix ];
  programs.nix-ld.enable = true; # Patches
  programs.command-not-found.enable = false;
  programs.less.enable = true; # Pager
  environment = {
    variables = {
      SYSTEMD_PAGERSECURE = "true";
      PAGER = "less -FR";
    };

    stub-ld.enable = true; # Kills dynamically linked executables
    defaultPackages = lib.modules.mkForce [ ]; # Removes default
    systemPackages = with pkgs; [ # First class citizens
      git
      curl
      wget
      pciutils
      lshw
    ];
  };
}
