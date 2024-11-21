{ pkgs, lib, config, ... }: {
  config = lib.mkIf (builtins.elem "clang-devkit" config.my.system.roles) {
    programs.ccache = {
      enable = true;
      cacheDir = "/var/cache/sccache";
    };

    environment.systemPackages = with pkgs; [
      gcc
      cmake
      gnumake

    ];
  };
}
