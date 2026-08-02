# Network related stuff

```nix
{
  my.network = {
    extraNameservers = [];
    fallbackDomains = [];
    fallbackDns = [];
    extraHosts = [];
    # Privacy
    dnscrypt.enable = false;
    tcpcrypt.enable = false;
    frkn.enable = false; # Check if config is valid ./privacy/frkn
    vpn.enable = false; # Requires config
    # Security
    fail2ban.enable = false;
    blocker.enable = false;
    # Other
    optimizeTcp = false;
    tailscale = {
      enable = true;
      defaultFlags = ["--ssh"];
      isClient = true;
      isServer = false;
    }
  };
}
```
