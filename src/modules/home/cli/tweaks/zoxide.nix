{ config, lib, ... }:

let cfg = config.my.home.cli;
in { config.programs.zoxide = lib.mkIf cfg.enableTweaks { enable = true; }; }
