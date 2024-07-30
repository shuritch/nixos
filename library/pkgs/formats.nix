{ pkgs, ... }: {
  gzipJson = { }: {
    type = (pkgs.formats.json { }).type;
    generate = name: value:
      pkgs.callPackage ({ runCommand, gzip, }:
        runCommand name {
          nativeBuildInputs = [ gzip ];
          value = builtins.toJSON value;
          passAsFile = [ "value" ];
        } ''
          gzip "$valuePath" -c > "$out"
        '') { };
  };
}
