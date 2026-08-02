{ config, ... }:

let cfg = config;
in {
  options.my.security = {
    # Doesn't require options
  };

  config.security = {
    protectKernelImage = true;
    lockKernelModules = false; # Breaks virtd, wireguard and iptables
    forcePageTableIsolation = true; # Page Table Isolation (PTI)
    allowUserNamespaces = true; # User namespaces are required for sandboxing.
    # Disable unprivileged user namespaces, unless containers are enabled
    unprivilegedUsernsClone = cfg.virtualisation.containers.enable;
    allowSimultaneousMultithreading = true;
    loginDefs.settings.ENCRYPT_METHOD = "SHA512";
  };
}
