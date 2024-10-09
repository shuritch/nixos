{ pkgs, lib, config, ... }:

let
  hostInfo = "$shell$username$hostname($shlvl)($cmd_duration)";
  nixInfo = "($nix_shell)\${custom.nix_inspect}";
  localInfo =
    "$directory($git_branch$git_commit$git_state$git_status)($aws$gcloud$openstack)";
  prompt = "$jobs$character";
in {
  config.programs.starship =
    lib.mkIf (config.my.home.cli.shell.type == "fish") {
      enable = true;
      settings = {
        add_newline = false;
        fill.symbol = " ";
        format = ''
          ${hostInfo} $fill ${nixInfo}
          ${localInfo} $fill $time
          ${prompt}
        '';

        cmd_duration = { format = "took [$duration]($style) "; };

        git_branch = {
          symbol = "󰊢 ";
          format = "on [$symbol$branch]($style) ";
          truncation_length = 4;
          truncation_symbol = "…/";
        };

        git_status = {
          format = "[\\($all_status$ahead_behind\\)]($style) ";
          conflicted = "🏳";
          up_to_date = " ";
          untracked = " ";
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
          stashed = "󰏗 ";
          modified = " ";
          staged = "[++\\($count\\)](green)";
          renamed = "󰖷 ";
          deleted = " ";
        };

        hostname = {
          format = "[@$hostname]($style) ";
          style = "bold green";
          ssh_only = false;
        };

        shlvl = {
          format = "[$shlvl]($style) ";
          style = "bold cyan";
          threshold = 2;
          repeat = true;
          disabled = false;
        };

        nix_shell = {
          format = "[($name \\(develop\\) <- )$symbol]($style) ";
          style = "bold red";
          impure_msg = "";
          symbol = " ";
        };

        custom = {
          nix_inspect = {
            when = "test -z $IN_NIX_SHELL";
            format = "[($output <- )$symbol]($style) ";
            style = "bold blue";
            symbol = " ";
            command = lib.getExe (pkgs.writeShellApplication {
              name = "nix-inspect";
              runtimeInputs = with pkgs; [ perl gnugrep findutils ];
              text = builtins.readFile ./nix-inspect-path.sh;
            });
          };
        };

        character = {
          error_symbol = "[~~>](bold red)";
          success_symbol = "[->>](bold green)";
          vimcmd_symbol = "[<<-](bold yellow)";
          vimcmd_visual_symbol = "[<<-](bold cyan)";
          vimcmd_replace_symbol = "[<<-](bold purple)";
          vimcmd_replace_one_symbol = "[<<-](bold purple)";
        };

        time = {
          format = "\\[[$time]($style)\\]";
          disabled = false;
        };

        username = {
          format = "[$user]($style) ";
          show_always = true;
        };

        directory = {
          truncation_length = 3;
          truncation_symbol = "…/";
          home_symbol = "󰋞 ";
          read_only_style = "197";
          read_only = "  ";
          format = "at [$path]($style)[$read_only]($read_only_style) ";

          substitutions = {
            "󰋞 /Documents" = "󰈙 ";
            "󰋞 /documents" = "󰈙 ";

            "󰋞 /Downloads" = " ";
            "󰋞 /downloads" = " ";

            "󰋞 /media/music" = " ";
            "󰋞 /media/pictures" = " ";
            "󰋞 /media/videos" = " ";
            "󰋞 /Music" = " ";
            "󰋞 /Pictures" = " ";
            "󰋞 /Videos" = " ";

            "󰋞 /dev" = "󱌢 ";
            "󰋞 /Dev" = "󱌢 ";

            "󰋞 /skl" = "󰑴 ";
            "󰋞 /.config" = " ";
          };
        };

        os = {
          style = "bold white";
          format = "[$symbol]($style)";
          symbols = {
            Arch = "";
            Artix = "";
            Debian = "";
            Kali = "󰠥";
            EndeavourOS = "";
            Fedora = "";
            NixOS = "";
            openSUSE = "";
            SUSE = "";
            Ubuntu = "";
            Raspbian = "";
            elementary = "";
            Coreos = "";
            Gentoo = "";
            mageia = "";
            CentOS = "";
            sabayon = "";
            slackware = "";
            Mint = "";
            Alpine = "";
            aosc = "";
            devuan = "";
            Manjaro = "";
            rhel = "";
            Macos = "󰀵";
            Linux = "";
            Windows = "";
          };
        };

        # Cloud
        gcloud.format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
        aws.format = "on [$symbol$profile(\\($region\\))]($style)";
        aws.symbol = " ";
        conda.symbol = " ";
        dart.symbol = " ";
        docker_context.symbol = " ";
        elm.symbol = " ";
        elixir.symbol = " ";
        gcloud.symbol = " ";
        golang.symbol = " ";
        hg_branch.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        nim.symbol = "󰆥 ";
        nodejs.symbol = "  ";
        package.symbol = "󰏗 ";
        perl.symbol = " ";
        php.symbol = " ";
        python.symbol = " ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        shlvl.symbol = " ";
        swift.symbol = "󰛥 ";
        terraform.symbol = "󱁢 ";
        container.symbol = "󰏖 ";
        lua.symbol = "󰢱 ";
        c.symbol = " ";
      };
    };
}
