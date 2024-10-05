{ lib, ... }: {
  options.my.home.desktop.exec = lib.mkOption {
    description = "List of executions to perform on startup.";
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };
}
