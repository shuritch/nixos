{ lib, config, ... }:

let cfg = config.my.security.polkit;
in {
  options.my.security.polkit.enable = lib.mkEnableOption "Enable polkit.";
  config.security.polkit = lib.mkIf cfg.enable { # Polkit will log all actions
    enable = true;
    debug = lib.mkDefault true;
    # Log authorization checks
    extraConfig = lib.mkIf config.security.polkit.debug ''
      polkit.addRule(function(action, subject) {
        polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
      });
    '';
  };
}
