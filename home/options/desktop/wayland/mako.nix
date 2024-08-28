{ config, pkgs, ... }:

let
  inherit (config.colorscheme) colors mode;
  font = config.fontProfiles.regular;
in {
  home.packages = with pkgs; [ libnotify ];
  services.mako = {
    enable = true;
    iconPath = if mode == "dark" then
      "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark"
    else
      "${config.gtk.iconTheme.package}/share/icons/Papirus-Light";
    font = "${font.name} ${toString font.size}";
    padding = "10,20";
    anchor = "top-center";
    width = 400;
    height = 150;
    borderSize = 2;
    defaultTimeout = 12000;
    backgroundColor = "${colors.surface}dd";
    borderColor = "${colors.secondary}dd";
    textColor = "${colors.on_surface}dd";
    layer = "overlay";
    extraConfig = ''
      max-history=50
    '';
  };
}
