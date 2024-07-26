{
  # Enable acme for usage with nginx vhosts
  # gpg.enable = true;
  security.acme = {
    defaults.email = "eu@misterio.me";
    acceptTerms = true;
  };

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
