{ pkgs, ... }: {
  programs.vscode.extensions = with pkgs.vscode-extensions;
    [
      visualstudioexptteam.intellicode-api-usage-examples
      streetsidesoftware.code-spell-checker
      visualstudioexptteam.vscodeintellicode
      christian-kohler.path-intellisense
      christian-kohler.npm-intellisense
      ms-ceintl.vscode-language-pack-ru
      kamikillerto.vscode-colorize
      ms-azuretools.vscode-docker
      yzhang.markdown-all-in-one
      aaron-bond.better-comments
      shardulm94.trailing-spaces
      stylelint.vscode-stylelint
      brettm12345.nixfmt-vscode
      editorconfig.editorconfig
      pkief.material-icon-theme
      ms-vscode.makefile-tools
      tamasfe.even-better-toml
      mechatroner.rainbow-csv
      oderwat.indent-rainbow
      tabnine.tabnine-vscode
      wix.vscode-import-cost
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      ecmel.vscode-html-css
      usernamehw.errorlens
      ibm.output-colorizer
      svelte.svelte-vscode
      denoland.vscode-deno
      hediet.vscode-drawio
      irongeek.vscode-env
      mhutchie.git-graph
      jnoortheen.nix-ide
      redhat.vscode-yaml
      ms-vscode.cpptools
      redhat.vscode-xml
      mikestead.dotenv
      ms-python.python
      ms-python.black-formatter
      ms-python.vscode-pylance
      tomoki1207.pdf
      redhat.ansible
      bbenoist.nix
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "markdown-pdf";
        publisher = "yzane";
        version = "1.5.0";
        sha256 = "sha256-aiifZgHXC4GUEbkKAbLc0p/jUZxp1jF/J1Y/KIyvLIE=";
      }
      {
        name = "html-css-class-completion";
        publisher = "Zignd";
        version = "1.20.0";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vscode-gutter-preview";
        publisher = "kisstkondoros";
        version = "0.31.2";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "gremlins";
        publisher = "rvest";
        version = "0.26.0";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vs-code-prettier-eslint";
        publisher = "nhoizey";
        version = "6.0.0";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "code-spell-checker-russian";
        publisher = "streetsidesoftware";
        version = "2.2.2";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "3.1.0";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "regexp-preview";
        publisher = "louiswt";
        version = "0.1.5";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "node-module-intellisense";
        publisher = "leizongmin";
        version = "1.5.0";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "rainglow";
        publisher = "daylerees";
        version = "1.5.2";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "jsoncrack-vscode";
        publisher = "aykutsarac";
        version = "2.0.3";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vscode-htmlhint";
        publisher = "htmlhint";
        version = "1.0.5";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vscode-nginx-conf";
        publisher = "ahmadalli";
        version = "0.3.5";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "nginx-formatter";
        publisher = "raynigon";
        version = "0.0.13";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      {
        name = "vscode-nginx";
        publisher = "william-voyek";
        version = "0.7.2";
        sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
      }
      # {
      #   name = "apc-extension";
      #   publisher = "drcika";
      #   version = "0.3.9";
      #   sha256 = "1hd0xr2lmq28qq9wwwrg380pb2shimi6ixz2zv36l5f0dc40iial";
      # }
    ];
}
