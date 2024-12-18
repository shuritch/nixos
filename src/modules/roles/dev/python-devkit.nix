{ pkgs, lib, config, ... }: {
  config = lib.mkIf (builtins.elem "python-devkit" config.my.system.roles) {
    environment.systemPackages = with pkgs; [
      gnumake
      python312Full
      python312Packages.pip
      python312Packages.matplotlib
      python312Packages.numpy
    ];
  };
}
