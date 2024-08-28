alone:
{ inputs, outputs, lib, config, pkgs, myEnv, ... }:

with lib;
let
  flakeInputs = filterAttrs (_: isType "flake") inputs;
  main = ../hosts/${myEnv.host}/home.nix;
in {
  imports = [ main ] ++ (builtins.attrValues outputs.homeManagerModules);
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home = {
    username = mkDefault myEnv.admin.login;
    homeDirectory = mkDefault "/home/${config.home.username}";
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = mkDefault myEnv.origin;
    sessionVariables = {
      FLAKE = myEnv.flake-location;
    } // (attrsets.optionalAttrs alone {
      NIX_PATH = (concatStringsSep ":"
        (mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs));
    });
  };

  nix = {
    registry = mkIf alone (mapAttrs (_: flake: { inherit flake; }) flakeInputs);
    package = mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      flake-registry = mkIf alone ""; # Disable global flake registry
      warn-dirty = false;
    };
  };

  nixpkgs = mkIf alone {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = myEnv.myEnv.permitedInsecurePackages;
    };
  };

  colorscheme.mode = mkOverride 1499 "dark";
  home.file.".colorscheme.json".text = builtins.toJSON config.colorscheme;
  specialisation = {
    dark.configuration.colorscheme.mode = mkOverride 1498 "dark";
    light.configuration.colorscheme.mode = mkOverride 1498 "light";
  };
}
