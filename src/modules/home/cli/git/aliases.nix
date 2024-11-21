{
  config.my.home.cli.shell.abbrs = {
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
