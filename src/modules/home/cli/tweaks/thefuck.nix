{ config, lib, ... }:

let cfg = config.my.home.cli;
in { config.programs.thefuck = lib.mkIf cfg.enableTweaks { enable = true; }; }
