{ ... }@input:

{
  grub-custom-fallout-theme = ./themes/fallout.nix;
  grub-custom-distro-theme = ./themes/distro.nix;
} // import ./themes/dedsec.nix input
