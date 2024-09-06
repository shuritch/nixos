{ ... }@input:

{
  grub-custom-fallout-theme = import ./themes/fallout.nix input;
  grub-custom-distro-theme = import ./themes/distro.nix input;
} // import ./themes/dedsec.nix input
