{ config, lib, ... }:

# https://github.com/b0o/SchemaStore.nvim/
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.schemastore = lib.mkIf cfg.enable {
    enable = true;
    yaml.enable = true;
    json.enable = true;
  };
}
