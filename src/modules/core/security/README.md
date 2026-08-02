# Security practices, most enable by design

```nix
{
  my.security = {
    auditd = {
      enable = false;
      autoPrune = {
        enable = true;
        size = 524288000;
        dates = "daily";
      };
    };
  };
}
```
