{ pkgs, lib, config, ... }:
let toYAML = pkgs.lib.generators.toYAML { };
in {
  config = lib.mkIf (config.my.home.cli.shell.type == "nushell") {
    programs.carapace.enable = true;
    xdg.configFile."carapace/bridges.yaml".text = toYAML {
      nh = "fish";
      hyprctl = "fish";
      pass = "fish";
      nix = "bash";
      man = "bash";
    };
  };
}
