{ myEnv, ... }: {
  # Enable acme for usage with nginx vhosts
  security = {
    pam.services = { swaylock = { }; };

    acme = {
      defaults.email = myEnv.admin.email;
      acceptTerms = true;
    };

    # Increase open file limit for sudoers
    pam.loginLimits = [
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
  };
}
