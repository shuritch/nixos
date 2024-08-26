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
    gadd = "git add";
    gall = "git add --all";
    gstatus = "git status";
    gbranch = "git branch";
    gmerge = "git merge";
    gdiff = "git diff";
    gpull = "git pull origin";
    gpullorg = "git pull origin";
    gpush = "git push";
    gpushorg = "git push origin";
    gpushtags = "git push --follow-tags";
    gclone = "git clone";
    gccommit = "git commit -m";
    gcommit = "git add --all && git commit -m";
    gtag = "git tag -ma";
    gcheck = "git checkout";
    gcheckb = "git checkout -b";

    glog = "git log --oneline --decorate --graph";
    glogall =
      "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
    glogdiff =
      "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
  };
}
