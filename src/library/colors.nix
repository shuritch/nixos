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

  pow = lib.fix (self: a: b: if b != 0 then a * (self a (b - 1)) else 1);
  base16To10 = exponent: scalar: scalar * pow 16 exponent;
  hexToDecMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
  };

  hexCharToDec = hex:
    if hexToDecMap ? ${lib.toLower hex} then
      hexToDecMap."${lib.toLower hex}"
    else
      throw "Character ${hex} is not a hexadecimal value.";

  hexToDec = hex:
    let
      decimals = builtins.map hexCharToDec (lib.stringToCharacters hex);
      decimalsAscending = lib.reverseList decimals;
      decimalsPowered = lib.imap0 base16To10 decimalsAscending;
    in lib.foldl builtins.add 0 decimalsPowered;
in rec {
  isHexColor = c: lib.isString c && (builtins.match hexRegExp c) != null;

  hexToRGBString = sep: hex:
    let
      rgbStartIndex = [ 0 2 4 ];
      hexList = builtins.map (x: builtins.substring x 2 hex) rgbStartIndex;
      hexLength = builtins.stringLength hex;
    in if hexLength != 6 then
      throw ''
        Unsupported hex string length of ${builtins.toString hexLength}.
        Length must be exactly 6.
      ''
    else
      lib.concatStringsSep sep (map toString (builtins.map hexToDec hexList));

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
      mode = if (isHexColor source) then "color hex" else "image";
    in pkgs.runCommand "colorscheme-${name}" { } ''
      mkdir "$out" -p
      for type in ${lib.concatStringsSep " " colorSchemeTypes}; do
        ${pkgs.matugen}/bin/matugen ${mode} --config ${config} -j hex -t "scheme-$type" "${source}" > "$out/$type.json"
      done
    '';
}
