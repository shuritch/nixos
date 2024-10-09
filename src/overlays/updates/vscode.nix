{ prev, ... }:

let
  apc-extension = builtins.fetchGit {
    url = "https://github.com/drcika/apc-extension.git";
    rev = "4d7d3b10ee1814880514728bd18ffac143329642";
  };
in {
  vscode = prev.vscode.overrideAttrs (attrs: {
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
