{ pkgs, ... }:

let
  userSettings = import ./settings;
  keybindings = import ./bindings.nix;
  dir = "$HOME/.config/Code/User";
in {
  imports = [ ./extentions.nix ./bindings.nix ];
  programs.vscode = {
    inherit userSettings keybindings;
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true;
  };

  home.activation = {
    beforeCheckLinkTargets = {
      after = [ ];
      before = [ "checkLinkTargets" ];
      data = ''
        if [ -f "${dir}/settings.json" ]; then
          rm "${dir}/settings.json"
        fi
        if [ -f "${dir}/keybindings.json" ]; then
          rm "${dir}/keybindings.json"
        fi
      '';
    };

    afterWriteBoundary = {
      after = [ "writeBoundary" ];
      before = [ ];
      data = ''
        cat ${
          (pkgs.formats.json { }).generate "settings.json" userSettings
        } > "${dir}/settings.json"
        cat ${
          (pkgs.formats.json { }).generate "keybindings.json" keybindings
        } > "${dir}/keybindings.json"
      '';
    };
  };
}
