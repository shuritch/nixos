{ pkgs, config, lib, ... }@input:

let
  userSettings = import ./settings config;
  keybindings = import ./bindings.nix;
  dir = "$HOME/.config/Code/User";
  cfg = config.my.home.programs;
in {
  options.my.home.programs.vscode.enable = lib.mkEnableOption "Enable vscode.";
  config = lib.mkIf cfg.vscode.enable {
    programs.vscode = {
      inherit userSettings keybindings;
      extensions = import ./extensions input;
      enableExtensionUpdateCheck = true;
      mutableExtensionsDir = true;
      enableUpdateCheck = false;
      package = pkgs.vscode;
      enable = true;
    };

    # Hyprland fix
    home.packages = [
      (pkgs.writeScriptBin "silent-code" ''
        #!/usr/bin/env bash

        /usr/bin/env code &
        while ! hyprctl clients | rg -i "Visual Studio Code"; do
          sleep 0.2
        done

        hyprctl dispatch movetoworkspacesilent 1,code
      '')
    ];

    # Fix of unchanaged settings
    home.activation = {
      beforeCheckLinkTargets = {
        before = [ "checkLinkTargets" ];
        after = [ ];
        data = ''
          if [ -f "${dir}/settings.json" ]; then
            rm -rf "${dir}/settings.json"
          fi
          if [ -f "${dir}/keybindings.json" ]; then
            rm -rf "${dir}/keybindings.json"
          fi
        '';
      };

      afterWriteBoundary = let
        jsonSettings = pkgs.writeText "tmp_vscs" (builtins.toJSON userSettings);
        jsonBindings = pkgs.writeText "tmp_vscb" (builtins.toJSON keybindings);
      in {
        before = [ ];
        after = [ "writeBoundary" "linkGeneration" ];
        data = ''
          rm -rf ${dir}/settings.json
          rm -rf ${dir}/keybindings.json
          cat ${jsonSettings} | ${pkgs.jq}/bin/jq --monochrome-output > "${dir}/settings.json"
          cat ${jsonBindings} | ${pkgs.jq}/bin/jq --monochrome-output > "${dir}/keybindings.json"
        '';
      };
    };
  };
}
