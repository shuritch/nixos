{ pkgs, config, lib, ... }: {
  options.my.home.cli.enableGitTweaks = lib.mkEnableOption "Enable GIT Tweaks";
  config = lib.mkIf (config.my.home.cli.enableGitTweaks) {
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      extensions = with pkgs; [
        gh-eco
        gh-markdown-preview
        gh-dash
        gh-cal
        gh-poi
      ];

      settings = {
        version = "1";
        git_protocol = "ssh";
        browser = "$BROWSER";
        prompt = "enabled";
        pager = "delta -s";
      };
    };

    programs.lazygit = {
      enable = true;
      settings = {
        notARepository = "quit";
        update.method = "never";
        gui = {
          nerdFontsVersion = 3;
          theme = {
            unstagedChangesColor = [ "red" "bold" ];
            selectedLineBgColor = [ "#263c42" ];
            selectedRangeBgColor = [ "#263c42" ];
          };
        };

        git.paging = {
          colorArg = "always";
          pager = "delta --paging=never";
        };
      };
    };
  };
}
