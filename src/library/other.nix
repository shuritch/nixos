{ lib, ... }:

with lib; rec {
  getHM = config: field:
    let
      fields = (lib.splitString "." field);
      user = config.my.system.admin;
      cfg = config.my.system.users.${user} or { };
      home = cfg.home or { };
    in lib.foldl (a: b: a.${b} or "undefined") home fields;

  checkHM = config: field: test:
    let sample = getHM config field;
    in (sample != "undefined" && sample == test);

  testHM = config: field:
    let sample = getHM config field;
    in (sample != "undefined" && sample == true);

  isx86Linux = pkgs: with pkgs.stdenv.hostPlatform; isLinux && isx86;
  merge = sample: foldl (a: b: a // b) { } sample;
  boolToNum = bool: if bool then 1 else 0;

  hasPackage = config: name:
    lib.any (x: (x.name or x.pname or null) == name) config.home.packages;

  indexOf = list: elem:
    let
      f = i:
        if i == (builtins.length list) then
          -1
        else if (builtins.elemAt list i) == elem then
          i
        else
          f (i + 1);
    in f 0;

}
