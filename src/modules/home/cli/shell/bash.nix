{ config, lib, pkgs, ... }:

let cfg = config.my.home.cli.shell;
in {
  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
    shellAliases = cfg.aliases // cfg.abbrs;
    historyFileSize = 1000;
    historySize = 100;
    shellOptions = [
      "cdspell"
      "checkjobs"
      "checkwinsize"
      "dirspell"
      "globstar"
      "histappend"
      "no_empty_cmd_completion"
    ];

    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${lib.meta.getExe pkgs.fish} $LOGIN_OPTION
      fi
    '';
  };
}
