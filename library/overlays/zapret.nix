{ prev, ... }:

prev.zapret.overrideAttrs (attrs: {
  installPhase = ''
    ${attrs.installPhase}
    touch $out/usr/share/zapret/config
  '';
})
