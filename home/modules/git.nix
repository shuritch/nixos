{ pkgs, env-config, ... }: {
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      core.editor = "nano";
      core.autocrlf = "input";
      user = {
        name = env-config.user.name;
        email = env-config.user.email;
      };
    };
  };
}
