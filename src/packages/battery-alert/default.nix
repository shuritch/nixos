{ pkgs, ... }:

let inherit (pkgs) stdenv libnotify upower;
in {
  battery-alert = stdenv.mkDerivation rec {
    version = "1.0.0";
    pname = "battery-alert";
    name = "${pname}-${version}";
    propagatedBuildInputs = [ libnotify ];
    dontUnpack = true;
    src = ./battery-alert.sh;

    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/battery-alert
      export ESCAPED_PATH=$(echo ${upower} | sed -e 's/[\/&]/\\&/g')
      sed -i "s/upower/$ESCAPED_PATH\/bin\/upower/g" $out/bin/battery-alert
      chmod +x $out/bin/battery-alert
    '';
  };
}
