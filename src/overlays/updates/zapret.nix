{ prev, ... }:

{
  zapret = prev.zapret.overrideAttrs (attrs: {
    src = builtins.fetchGit {
      url = "https://github.com/bol-van/zapret.git";
      rev = "171ae7ccdc4789f889cc95844c1e5aaef41f9bcd";
    };

    installPhase = ''
      ${attrs.installPhase}
      touch $out/usr/share/zapret/config
    '';
  });
}
