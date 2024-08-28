{ myEnv, ... }: {
  security = {
    pam = {
      services.swaylock = { };
      loginLimits = [
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

    acme = {
      defaults.email = myEnv.admin.email;
      acceptTerms = true;
    };
  };
}
