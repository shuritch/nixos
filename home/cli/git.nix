{ config, ... }: {
  programs.git = {
    enable = true;
    userName = config.users.users.${config.main-user}.description;
    userEmail = config.users.users.${config.main-user}.email;
    extraConfig = {
      init.defaultBranch = "main";
      core.autocrlf = "input";
    };
  };
}
