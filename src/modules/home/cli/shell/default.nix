{ lib, config, ... }:

let cfg = config.my.home.cli.shell;
in {
  imports = [ ./fish.nix ./nushell.nix ./zsh.nix ./bash.nix ./settings ];
  options.my.home.cli.shell = {
    type = lib.mkOption {
      description = "Choose preferred shell";
      type = lib.types.enum [ "bash" "fish" "nushell" "zsh" ];
      default = "bash";
    };

    abbrs = lib.mkOption {
      description = "Set of abbreviations";
      type = lib.types.attrsOf lib.types.str;
      default = { };
    };

    aliases = lib.mkOption {
      description = "Set of aliases";
      type = lib.types.attrsOf lib.types.str;
      default = { };
    };
  };

  config = {
    home.sessionVariables.SHELL = "/run/current-system/sw/bin/${cfg.type}";
    my.home.cli.shell.aliases = {
      c = "printf '\\033[2J\\033[3J\\033[1;1H'";
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
      ":q" = "exit";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
    };

    my.home.cli.shell.abbrs = lib.mkMerge [
      {
        clean-switch =
          "sudo systemctl stop zapret.service; sudo nixos-rebuild switch --flake $FLAKE";
        nix-edit = "$EDITOR $FLAKE";
        errlog = "journalctl -p 3 -xb";
        mkd = "mkdir -pv";
        dsize = "du -hs";
        dev = "df -h";
        js = "node";
      }

      (lib.mkIf config.my.services.podman.enable {
        docker = "podman";
        docker-compose = "podman-compose";
      })

      (lib.mkIf config.programs.nixvim.enable {
        v = "nvim";
        vi = "nvim";
        vim = "nvim";
        nixvim = "nvim";
      })

      (lib.mkIf config.programs.micro.enable { nano = "micro"; })
      (lib.mkIf config.my.home.cli.enableTweaks {
        space = "ncdu";
        htop = "btop";
        cat = "bat";
        # cd = "z";
        ls = "eza";
        exa = "eza";
        l = "eza --icons  -a --group-directories-first -1";
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";
      })
    ];
  };
}
