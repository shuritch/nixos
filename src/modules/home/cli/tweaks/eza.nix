{ config, lib, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.eza = lib.mkIf cfg.enableTweaks {
    enable = true;
    icons = "auto";
    extraOptions = [
      "--group"
      "--group-directories-first"
      "--header"
      "--no-permissions"
      "--octal-permissions"
    ];
  };
}
