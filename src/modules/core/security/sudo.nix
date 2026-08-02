{ lib, config, pkgs, ... }:

let cfg = config;
in {
  options.my.security = {
    # Doesn't require options
  };

  config = {
    security.sudo-rs = {
      enable = true; # password less sudo 👇
      wheelNeedsPassword = lib.mkDefault false;
      execWheelOnly = true;
      extraConfig = ''
        Defaults !lecture
        Defaults pwfeedback
        Defaults env_keep += "EDITOR PATH DISPLAY"
        Defaults timestamp_timeout = 300
      '';

      extraRules = let inherit (lib) getExe';
      in [{
        groups = [ "wheel" ];
        commands = [
          {
            command = getExe' cfg.system.build.nixos-rebuild "nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = getExe' pkgs.systemd "systemctl";
            options = [ "NOPASSWD" ];
          }
          {
            command = getExe' pkgs.systemd "reboot";
            options = [ "NOPASSWD" ];
          }
          {
            command = getExe' pkgs.systemd "shutdown";
            options = [ "NOPASSWD" ];
          }
        ];
      }];
    };
  };
}
