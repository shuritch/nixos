{ inputs, outputs, lib, env-config, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  imports = [ ./modules ];
  systemd.user.startServices = "sd-switch"; # Hotreload
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home = {
    username = env-config.user.login;
    homeDirectory = "/home/${env-config.user.login}";
    stateVersion = env-config.originVersion;
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = builtins.attrValues outputs.overlays;
  };

  home.sessionVariables = {
    NIX_PATH = lib.concatStringsSep ":"
      (lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs);
  };
}
