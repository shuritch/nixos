{ lib, stdenv, meson, ninja, dbus, pkg-config, ... }:

stdenv.mkDerivation {
  pname = "iio-hyprland";
  version = "unstable-2023-09-27";
  src = lib.cleanSource ./.;
  nativeBuildInputs = [ pkg-config dbus meson ninja ];
  meta = with lib; {
    mainProgram = "iio-hyprland";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
