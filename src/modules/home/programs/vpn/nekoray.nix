{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.nekoray.enable = lib.mkEnableOption "Enable nekoray";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.nekoray.enable) {
    home.packages = with pkgs;
      [ nekoray ] ++ (lib.optionals config.my.network.frkn.enable [
        (pkgs.writeShellApplication {
          runtimeInputs = with pkgs; [ systemd nekoray ];
          name = "toggle-vpn";
          text = ''
            #!/usr/bin/env bash
            status=$(systemctl is-active zapret.service)
            export SHELL="/run/current-system/sw/bin/fish"
            if [[ "$status" == "active" ]]; then
                systemctl stop zapret.service
                nekoray
            else
                systemctl start zapret.service
                pkill nekoray
            fi
          '';
        })
      ]);
  };
}
