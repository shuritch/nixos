{ pkgs, config, lib, ... }:

let
  hostinfo = "$shell$username$hostname($shlvl)($cmd_duration)";
  nixInfo = "($nix_shell)\${custom.nix_inspect}";
  localInfo =
    "$directory($git_branch$git_commit$git_state$git_status)($aws$gcloud$openstack)";
  prompt = "$jobs$character";
in {
  import = [ ./alacritty.nix ./zsh.nix ];
  users.defaultUserShell = pkgs.zsh;
  programs.starship = {
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
      username = {
        format = "[$user]($style)";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold green";
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
        impure_msg = "";
        symbol = " ";
        style = "bold red";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };

      custom = {
        nix_inspect = {
          when = "test -z $IN_NIX_SHELL";
          command = lib.getExe (pkgs.writeShellApplication {
            name = "nix-inspect";
            runtimeInputs = with pkgs; [ perl gnugrep findutils ];
            text = builtins.readFile ./nix-inspect-path.sh;
          });
          format = "[($output <- )$symbol]($style) ";
          symbol = " ";
          style = "bold blue";
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

      # Cloud
      gcloud.format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
      aws.format = "on [$symbol$profile(\\($region\\))]($style)";
      aws.symbol = " ";
      conda.symbol = " ";
      dart.symbol = " ";
      directory.read_only = " ";
      docker_context.symbol = " ";
      elm.symbol = " ";
      elixir.symbol = " ";
      gcloud.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      nim.symbol = "󰆥 ";
      nodejs.symbol = " ";
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
    };
  };

}
