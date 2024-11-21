{ lib, ... }: {
  options.my.home.cli.enableScripts = lib.mkEnableOption "Enable scripts";
  imports = [ ./extract.nix ./music.nix ];
}
