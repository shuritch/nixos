{ pkgs, config, ... }:

let
  userSettings = import ./settings config;
  keybindings = import ./bindings.nix;
  jsonSettings =
    pkgs.writeText "tmp_vscode_settings" (builtins.toJSON userSettings);
  jsonBindings =
    pkgs.writeText "tmp_vscode_settings" (builtins.toJSON keybindings);
  dir = "$HOME/.config/Code/User";
in {
  imports = [ ./extensions ];
  programs.vscode = {
    inherit userSettings keybindings;
    package = pkgs.vscode;
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
          rm -rf "${dir}/settings.json"
        fi
        if [ -f "${dir}/keybindings.json" ]; then
          rm -rf "${dir}/keybindings.json"
        fi
      '';
    };

    afterWriteBoundary = {
      after = [ "writeBoundary" "linkGeneration" ];
      before = [ ];
      data = ''
        rm -rf ${dir}/settings.json
        rm -rf ${dir}/keybindings.json
        cat ${jsonSettings} | ${pkgs.jq}/bin/jq --monochrome-output > "${dir}/settings.json"
        cat ${jsonBindings} | ${pkgs.jq}/bin/jq --monochrome-output > "${dir}/keybindings.json"
      '';
    };
  };
}
