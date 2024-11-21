{ pkgs, inputs, lib, config, ... }:

let cfg = config.my.home;
in {
  imports = [
    # ./theme
    ./annoyances.nix
    ./bookmarks.nix
    ./engines.nix
    ./features.nix
    ./layout.nix
    ./privacy.nix
    ./security.nix
    ./tracking.nix
  ];

  options.my.home.programs.firefox.enable =
    lib.mkEnableOption "Enable Firefox.";

  config.programs.firefox =
    lib.mkIf (cfg.desktop.enable && cfg.programs.firefox.enable) {
      enable = true;
      package = pkgs.firefox-devedition-bin;
      profiles.dev-edition-default = {
        id = 0;
        name = "dev-edition-default";
        isDefault = true;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          sponsorblock
          return-youtube-dislikes
          youtube-shorts-block

          (wappalyzer.overrideAttrs { meta.license.free = true; })
          (languagetool.overrideAttrs { meta.license.free = true; })
          simple-translate
        ];
      };
    };
}
