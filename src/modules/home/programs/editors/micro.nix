{ lib, config, ... }:

let cfg = config.my.home.programs;
in {
  options.my.home.programs.micro.enable =
    lib.mkEnableOption "Enable micro editor";

  config = lib.mkIf cfg.micro.enable {
    programs.micro = {
      enable = true;
      settings = {
        "autosu" = true;
        "clipboard" = "terminal";
        "eofnewline" = false;
        "savecursor" = true;
        "statusformatl" =
          "$(filename) @($(line):$(col)) $(modified)| $(opt:filetype) $(opt:encoding)";
      };
    };
  };
}
