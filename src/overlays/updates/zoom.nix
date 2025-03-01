# https://github.com/NixOS/nixpkgs/issues/322970
{ prev, final, ... }:

let version = "6.0.2.4680";
in {
  zoom-us =
    (prev.zoom-us.override { pipewire = prev.pipewire-zoom; }).overrideAttrs
    (_: {
      inherit version;
      src = prev.fetchurl {
        url = "https://zoom.us/client/${version}/zoom_x86_64.pkg.tar.xz";
        hash = "sha256-027oAblhH8EJWRXKIEs9upNvjsSFkA0wxK1t8m8nwj8=";
      };
    });
}
