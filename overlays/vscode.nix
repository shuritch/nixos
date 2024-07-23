{ pkgs, ... }:

let
  apc-extension = builtins.fetchGit {
    url = "https://github.com/drcika/apc-extension.git";
    rev = "d4cc908bf2869fe354aa0c103bab063aa09fd491";
  };
in ({ final, prev }:
  prev.vscode.overrideAttrs (oldAttrs: {
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.bun ];
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
  }))
