{ pkgs, myEnv, ... }:

{
  home.packages = [ pkgs.lazygit ];

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = myEnv.admin.description;
    userEmail = myEnv.admin.email;
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

  programs.fish.shellAbbrs = {
    g = "lazygit";
    gadd = "git add --all";
    gcommit = "git add --all && git commit -m";
    gtag = "git tag -ma";
    glog = "git log --oneline --decorate --graph";
    glogall =
      "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
    glogdiff =
      "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
  };
}
