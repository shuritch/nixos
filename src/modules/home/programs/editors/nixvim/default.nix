{ inputs, config, lib, ... }:

let cfg = config.my.home.programs;
in {
  imports =
    [ inputs.nixvim.homeManagerModules.nixvim ./config ./plugins ./colors ];
  options.my.home.programs.nixvim.enable = lib.mkEnableOption "Enable nixvim.";
  config.programs.nixvim = lib.mkIf cfg.nixvim.enable {
    defaultEditor = true;
    enable = true;
  };
}
