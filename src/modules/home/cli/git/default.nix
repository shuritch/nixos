{ pkgs, config, ... }:

let admin = config.my.system.users.${config.my.system.admin};
in {
  imports = [ ./aliases.nix ./ignores.nix ./tweaks.nix ];
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = admin.description;
    userEmail = admin.email;

    lfs = {
      enable = true;
      skipSmudge = true;
    };

    delta = {
      enable = true;

      options = {
        dark = true;
        navigate = true;
        syntax-theme = "base16-256";
        features = "decorations side-by-side navigate";
        whitespace-error-style = "22 reverse";
        side-by-side = true;
        true-color = "always";

        line-numbers = true;
        line-numbers-left-format = "";
        line-numbers-right-format = "│ ";

        plus-style = ''syntax "#003800"'';
        minus-style = ''syntax "#3f0001"'';

        decorations = {
          commit-decoration-style = "cyan bold box ul";
          file-style = "cyan bold ul";
          file-decoration-style = "cyan bold ul";
          hunk-header-decoration-style = "cyan box ul";
        };
      };
    };

    extraConfig = {
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      init.defaultBranch = "main";
      help.autocorrect = 10;
      log.date = "iso";
      column.ui = "auto";
      commit.verbose = true;
      fetch.prune = true;

      pull.ff = "only";
      color.ui = "auto";
      repack.usedeltabaseoffset = "true";

      diff.mnemonicprefix = true;
      transfer.fsckObjects = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;

      core = {
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        autocrlf = "input";
        askPass = "";
      };

      branch = {
        autosetupmerge = "true";
        sort = "committerdate";
      };

      push = {
        default = "current";
        followTags = true;
        autoSetupRemote = true;
      };

      merge = {
        stat = "true";
        conflictstyle = "zdiff3";
        tool = "meld";
      };

      rebase = {
        updateRefs = true;
        autoSquash = true;
        autoStash = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      url = {
        "https://github.com/".insteadOf = "github:";
        "ssh://git@github.com/".pushInsteadOf = "github:";
        "https://gitlab.com/".insteadOf = "gitlab:";
        "ssh://git@gitlab.com/".pushInsteadOf = "gitlab:";
        "https://aur.archlinux.org/".insteadOf = "aur:";
        "ssh://aur@aur.archlinux.org/".pushInsteadOf = "aur:";
        "https://git.sr.ht/".insteadOf = "srht:";
        "ssh://git@git.sr.ht/".pushInsteadOf = "srht:";
        "https://codeberg.org/".insteadOf = "codeberg:";
        "ssh://git@codeberg.org/".pushInsteadOf = "codeberg:";
      };
    };
  };
}
