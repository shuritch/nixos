{ config, lib, pkgs, ... }:

# Indent highlighting
# https://github.com/shellRaining/hlchunk.nvim
let cfg = config.programs.nixvim;
in {
  programs.nixvim = lib.mkIf cfg.enable {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "hlchunk";
        src = pkgs.fetchFromGitHub {
          owner = "shellRaining";
          repo = "hlchunk.nvim";
          rev = "930fe6262f87d66ca0c85dada3bb7c2a8cb6ec3e";
          hash = "sha256-IwxyUwL10pop+Aod7BFM67JFXVY37z2Ly4EnlGPwfls=";
        };
      })
    ];
  };
}
