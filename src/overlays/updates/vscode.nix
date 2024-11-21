{ prev, final, ... }:

let
  inherit (final.stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";
  archive_fmt = if final.stdenv.isDarwin then "zip" else "tar.gz";
  plat = {
    x86_64-linux = "linux-x64";
    x86_64-darwin = "darwin";
    aarch64-linux = "linux-arm64";
    aarch64-darwin = "darwin-arm64";
    armv7l-linux = "linux-armhf";
  }.${system} or throwSystem;

  sha256 = {
    x86_64-linux = "0475kwa3ym14l9ggaf2hg4lcrc0lpi9vchzj4sgj4c3606l9i1aa";
    x86_64-darwin = "15sz42p7khzxpxii4zx14770kzyk4a3g1kwxjwvd46nxqjqciys4";
    aarch64-linux = "14d5p764vx1ppi5f6b6v0wrn1wr3qqyfr6mpncjhnzr2pdss9fz0";
    aarch64-darwin = "0kdh7a0nfpadhyn6cj89vw76hhbab4fg5wifbzdrjikwfg8jbd4b";
    armv7l-linux = "1aqlpxyzjrf6qm0znyqbl7srn251f7ra5lj594b7906lxhirin3c";
  }.${system} or throwSystem;

  apc-extension = builtins.fetchGit {
    url = "https://github.com/drcika/apc-extension.git";
    rev = "4d7d3b10ee1814880514728bd18ffac143329642";
  };
in {
  vscode = prev.vscode.overrideAttrs (attrs: rec {
    version = "1.93.1";
    rev = "38c31bc77e0dd6ae88a4e9cc93428cc27a56ba40";

    src = final.fetchurl {
      name = "VSCode_${version}_${plat}.${archive_fmt}";
      url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      inherit sha256;
    };

    vscodeServer = final.srcOnly {
      name = "vscode-server-${rev}.tar.gz";
      stdenv = final.stdenv;
      src = final.fetchurl {
        name = "vscode-server-${rev}.tar.gz";
        url =
          "https://update.code.visualstudio.com/commit:${rev}/server-linux-x64/stable";
        sha256 = "sha256-HmfeiVSCtBiUJB2smSk0KCJps7C6Bs3kO9MGZHDatzM=";
      };
    };

    buildInputs = attrs.buildInputs ++ [ prev.bun ];
    postInstall = ''
      cd $out
      mkdir apc-extension
      sed '1d' ${apc-extension}/src/patch.ts >> $out/apc-extension/patch.ts
      sed "s%require.main!.filename%'$out/lib/vscode/resources/app/out/dummy'%g" -i  $out/apc-extension/patch.ts
      sed "s%vscode.window.showErrorMessage(%throw new Error(installationPath + %g" -i  $out/apc-extension/patch.ts
      sed "s%promptRestart();%%g" -i  $out/apc-extension/patch.ts
      sed '1d' ${apc-extension}/src/utils.ts > $out/apc-extension/utils.ts
      ls $out/apc-extension >> log
      echo "import { install } from './patch.ts'; install({ extensionPath: '${apc-extension}' })" > $out/apc-extension/install.ts
      bun apc-extension/install.ts
    '';
  });
}
