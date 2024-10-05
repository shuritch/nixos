{ lib, pkgs, config, ... }:

let cfg = config.my.security;
in {
  options.my.security.selinux = {
    enable = lib.mkEnableOption "System SELinux support + kernel patches";
    state = lib.mkOption {
      description = "SELinux state to boot with. The default is enforcing.";
      type = lib.types.enum [ "enforcing" "permissive" "disabled" ];
      default = "enforcing";
    };

    type = lib.mkOption {
      description = "SELinux policy type to boot with.";
      type = lib.types.enum [ "targeted" "minimum" "mls" ];
      default = "targeted";
    };
  };

  config = lib.mkIf cfg.selinux.enable {
    # build systemd with SE Linux support so it loads policy at boot and supports file labelling
    systemd.package = pkgs.systemd.override { withSelinux = true; };
    security.apparmor.enable = lib.mkForce false;
    boot = {
      # tell kernel to use SE Linux by adding necessary parameters
      kernelParams = [ "security=selinux" "selinux=1" ];
      # compile kernel with SE Linux support
      # with additional support for other LSM modules
      kernelPatches = [{
        name = "selinux-config";
        patch = null;
        extraConfig = ''
          SECURITY_SELINUX y
          SECURITY_SELINUX_BOOTPARAM n
          SECURITY_SELINUX_DISABLE n
          SECURITY_SELINUX_DEVELOP y
          SECURITY_SELINUX_AVC_STATS y
          SECURITY_SELINUX_CHECKREQPROT_VALUE 0
          DEFAULT_SECURITY_SELINUX n
        '';
      }];
    };

    environment = {
      # for load_policy, fixfiles, setfiles, setsebool, semodile, and sestatus.
      systemPackages = [ pkgs.policycoreutils ];
      # write selinux config to /etc/selinux
      etc."selinux/config".text = ''
        # SELINUX= can take one of these three values:
        # enforcing - SELinux security policy is enforced.
        # permissive - SELinux prints warnings instead of enforcing.
        # disabled - No SELinux policy is loaded.
        SELINUX=${cfg.selinux.state}
        # targeted - Targeted processes are protected,
        # minimum - Modification of targeted policy. Only selected processes are protected.
        # mls - Multi Level Security protection.
        SELINUXTYPE=${cfg.selinux.type}
      '';
    };
  };
}
