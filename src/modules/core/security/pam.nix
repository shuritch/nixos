{
  # fix "too many files open"
  security.pam = {
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

    # allow screen lockers to also unlock the screen
    services = {
      tuigreet = { };
      swaylock = { };
      hyprlock = { };
      gtklock = { };
      greetd = { };
      login = { };
    };
  };
}
