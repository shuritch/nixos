{ pkgs, ... }:
with pkgs.vscode-extensions; [
  # Intellisense
  visualstudioexptteam.intellicode-api-usage-examples
  visualstudioexptteam.vscodeintellicode
  christian-kohler.path-intellisense
  christian-kohler.npm-intellisense
  # Linters
  streetsidesoftware.code-spell-checker
  stylelint.vscode-stylelint
  shardulm94.trailing-spaces
  editorconfig.editorconfig
  esbenp.prettier-vscode
  dbaeumer.vscode-eslint
  usernamehw.errorlens
  # Syntax support
  redhat.vscode-yaml
  ecmel.vscode-html-css
  svelte.svelte-vscode
  ms-vscode.makefile-tools
  ms-azuretools.vscode-docker
  tamasfe.even-better-toml
  irongeek.vscode-env
  mikestead.dotenv
  redhat.vscode-xml
  jnoortheen.nix-ide
  brettm12345.nixfmt-vscode
  bbenoist.nix
  # Other
  kamikillerto.vscode-colorize
  yzhang.markdown-all-in-one
  aaron-bond.better-comments
  pkief.material-icon-theme
  tabnine.tabnine-vscode
  wix.vscode-import-cost
  ibm.output-colorizer
  #? Corner cases
  # tomoki1207.pdf
  # mhutchie.git-graph
  # hediet.vscode-drawio
  # ms-vscode.cpptools
  # ms-python.python
  # ms-python.black-formatter
  # ms-python.vscode-pylance
  # redhat.ansible
]
