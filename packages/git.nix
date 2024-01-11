{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      core.editor = "nano";
      core.autocrlf = "input";
      user = {
        name = "Alexander Ivanov";
        email = "sashapop10@yandex.ru";
      };
    };
  };
}