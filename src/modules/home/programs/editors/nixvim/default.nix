{ inputs, config, lib, ... }:

let
  cfg = config.my.home.programs;
  module = inputs.nixvim.homeManagerModules.nixvim;
in {
  imports = [ module ./config ./plugins ];
  options.my.home.programs.nixvim.enable = lib.mkEnableOption "Enable nixvim.";
  config.programs.nixvim = lib.mkIf cfg.nixvim.enable {
    defaultEditor = true;
    enable = true;
  };
}
