{ inputs, outputs, lib, config, pkgs, myEnv, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  imports = [ ] ++ (builtins.attrValues outputs.homeManagerModules);
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home = {
    username = lib.mkDefault myEnv.admin.login;
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = lib.mapAttrsToList (_: v: v) pkgs.scripts;
    sessionVariables.FLAKE = myEnv.flake-location;
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = lib.mkDefault "23.11";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      warn-dirty = false;
    };
  };

  home.sessionVariables = {
    NIX_PATH = lib.concatStringsSep ":"
      (lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs);
  };

  colorscheme.mode = lib.mkOverride 1499 "dark";
  home.file.".colorscheme.json".text = builtins.toJSON config.colorscheme;
  specialisation = {
    dark.configuration.colorscheme.mode = lib.mkOverride 1498 "dark";
    light.configuration.colorscheme.mode = lib.mkOverride 1498 "light";
  };
}
