{ config, lib, pkgs, ... }:

let
  rmHash = lib.removePrefix "#";
  inherit (config.my.home.colorscheme) base16colors;
  cfg = config.programs.shellcolor;
  renderSetting = key: value: ''
    ${key}=${value}
  '';
  renderSettings = settings:
    lib.concatStrings (lib.mapAttrsToList renderSetting settings);
in {
  options.programs.shellcolor = {
    enable = lib.mkEnableOption "Enable shell colorizer." // {
      default = true;
    };

    enableBashIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Bash integration.
      '';
    };

    enableZshIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Zsh integration.
      '';
    };

    enableFishIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Fish integration.
      '';
    };

    enableNushellIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Nushell integration.
      '';
    };

    enableBashSshFunction = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = ''
        Whether to enable SSH integration by replacing ssh with a bash function.
      '';
    };

    enableFishSshFunction = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = ''
        Whether to enable SSH integration by replacing ssh with a fish function.
      '';
    };

    settings = lib.mkOption {
      description = "Options for shellcolord config file. Colors (without #)";
      type = lib.types.attrsOf lib.types.str;
      default = lib.mapAttrs (_: rmHash) base16colors;
    };
  };

  config = lib.mkIf config.programs.shellcolor.enable {
    home.packages = [ pkgs.shellcolord ];
    xdg.configFile."shellcolor.conf" = lib.mkIf (cfg.settings != { }) {
      text = renderSettings cfg.settings;
      onChange = ''
        timeout 1 ${pkgs.shellcolord}/bin/shellcolor apply || true
      '';
    };

    programs.zsh.initExtra = lib.mkIf cfg.enableZshIntegration (lib.mkBefore ''
      ${pkgs.shellcolord}/bin/shellcolord $$ & disown
    '');

    programs.fish.interactiveShellInit = lib.mkIf cfg.enableFishIntegration
      (lib.mkBefore ''
        ${pkgs.shellcolord}/bin/shellcolord $fish_pid & disown
      '');

    programs.nushell.configFile.text = lib.mkIf cfg.enableNushellIntegration
      (lib.mkBefore ''
        ${pkgs.bash}/bin/bash -c $"${pkgs.shellcolord}/bin/shellcolord ($nu.pid) & disown"
      '');

    programs.bash.initExtra = lib.mkIf cfg.enableBashIntegration
      (lib.mkBefore ''
        ${pkgs.shellcolord}/bin/shellcolord $$ & disown
        ${lib.optionalString cfg.enableBashSshFunction ''
          ssh() {
            ${pkgs.shellcolord}/bin/shellcolor disable $$
            command ssh "$@"
            ${pkgs.shellcolord}/bin/shellcolor enable $$
            ${pkgs.shellcolord}/bin/shellcolor apply $$
          }
        ''}
      '');

    programs.fish.functions.ssh = lib.mkIf cfg.enableFishSshFunction ''
      ${pkgs.shellcolord}/bin/shellcolor disable $fish_pid
      command ssh $argv
      ${pkgs.shellcolord}/bin/shellcolor enable $fish_pid
      ${pkgs.shellcolord}/bin/shellcolor apply $fish_pid
    '';
  };
}
