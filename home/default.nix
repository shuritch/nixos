{ inputs, outputs, lib, config, pkgs, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  imports = [ ./cli ./colorscheme.nix ]
    ++ (builtins.attrValues outputs.homeManagerModules);
  systemd.user.startServices = "sd-switch"; # Hotreload
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home = {
    username = lib.mkDefault config.main-user;
    homeDirectory = lib.mkDefault "/home/${config.main-user}";
    stateVersion = lib.mkDefault config.originVersion;
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = { FLAKE = config.flakeLocation; };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      warn-dirty = false;
    };
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
