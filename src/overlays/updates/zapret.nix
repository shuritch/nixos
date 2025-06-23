{ prev, ... }:

{
  zapret = prev.zapret.overrideAttrs (attrs: {
    src = builtins.fetchGit {
      url = "https://github.com/bol-van/zapret.git";
      rev = "29c8aec1116d504692bebc16420d0e3ad65c030b";
    };

    installPhase = ''
      ${attrs.installPhase}
      touch $out/usr/share/zapret/config
    '';
  });
}
