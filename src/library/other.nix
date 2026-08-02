{ lib, ... }: rec {
  # Gets home property value
  getHM = cfg: field:
    let
      isRoot = builtins.stringLength field == 0;
      cfg = cfg.my.system.users.${cfg.my.system.admin} or { };
      home = cfg.home or { };
    in if isRoot then
      home
    else
      lib.foldl (a: b: a.${b} or "undefined") home (lib.splitString "." field);

  # Checks home property value
  checkHM = config: field: test:
    let sample = getHM config field;
    in (sample != "undefined" && sample == test);

  # Checks home property value to be true
  testHM = config: field:
    let sample = getHM config field;
    in (sample != "undefined" && sample == true);
}
