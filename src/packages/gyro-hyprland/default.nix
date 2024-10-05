{ lib, pkgs, ... }: {
  gyro-hyprland = pkgs.stdenv.mkDerivation {
    pname = "gyro-hyprland";
    version = "unstable-2023-09-27";
    src = lib.cleanSource ./.;
    nativeBuildInputs = with pkgs; [ pkg-config dbus meson ninja ];
    meta = with lib; {
      mainProgram = "gyro-hyprland";
      license = licenses.unlicense;
      platforms = platforms.all;
    };
  };
}
