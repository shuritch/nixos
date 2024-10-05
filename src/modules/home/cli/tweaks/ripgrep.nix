{ config, lib, ... }:

let cfg = config.my.home.cli;
in {
  # https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
  config.programs.ripgrep = lib.mkIf cfg.enableTweaks {
    enable = true;
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--glob=!.git/*"
      "--smart-case"
      "--hidden"

      "--colors=line:none"
      "--colors=line:style:bold"
    ];
  };
}
