{ pkgs, vars, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = vars.admin.description;
    userEmail = vars.admin.email;
    ignores = [ ".direnv" "result" ];
    lfs.enable = true;
    extraConfig = {
      branch.sort = "committerdate";
      init.defaultBranch = "main";
      core.autocrlf = "input";
      log.date = "iso";
      column.ui = "auto";
      push.autoSetupRemote = true;
      rerere.enabled = true;
    };
  };
}
