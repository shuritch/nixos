{ lib, config, ... }:

let cfg = config.my.security;
in {
  options.my.security = {
    wheelNeedsPassword = lib.mkEnableOption "Ask for password wheel users." // {
      default = true;
    };
  };

  config.security = {
    sudo-rs.enable = lib.mkForce false; # unstable
    sudo = {
      enable = true; # paswordless sudo 👇
      wheelNeedsPassword = lib.mkDefault cfg.wheelNeedsPassword;
      execWheelOnly = true;
      extraConfig = ''
        Defaults lecture = never
        Defaults pwfeedback
        Defaults env_keep += "EDITOR PATH DISPLAY"
        Defaults timestamp_timeout = 300
      '';

      extraRules = [{
        groups = [ "wheel" ];
        commands = [
          {
            command = "/nix/store/*/bin/switch-to-configuration";
            options = [ "SETENV" "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nix-store";
            options = [ "SETENV" "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nix-env";
            options = [ "SETENV" "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/darwin-rebuild";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nix-collect-garbage";
            options = [ "SETENV" "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/systemctl";
            options = [ "NOPASSWD" ];
          }
        ];
      }];
    };
  };
}
