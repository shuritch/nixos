{ lib, ... }:

let
  hexRegExp = "#([0-9a-fA-F]{3}){1,2}";
  colorSchemeConfig = {
    templates = { };
    config.custom_colors = {
      red = "#dd0000";
      orange = "#dd5522";
      yellow = "#dddd00";
      green = "#22dd22";
      cyan = "#22dddd";
      blue = "#2222dd";
      magenta = "#dd22dd";
    };
  };
in rec {
  isHexColor = c: lib.isString c && (builtins.match hexRegExp c) != null;

  colorSchemeTypes = [
    "content"
    "expressive"
    "fidelity"
    "fruit-salad"
    "monochrome"
    "neutral"
    "rainbow"
    "tonal-spot"
  ];

  generateColorscheme = pkgs: name: source:
    let
      config = (pkgs.formats.toml { }).generate "config.toml" colorSchemeConfig;
      type = if (isHexColor source) then "color hex" else "image";
    in pkgs.runCommand "colorscheme-${name}" { } ''
      mkdir "$out" -p
      for type in ${lib.concatStringsSep " " colorSchemeTypes}; do
        ${pkgs.matugen}/bin/matugen ${type} --config ${config} -j hex -t "scheme-$type" "${source}" > "$out/$type.json"
      done
    '';
}
