{ pkgs, ... }:
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  # Intelisense
  {
    name = "node-module-intellisense";
    publisher = "leizongmin";
    version = "1.5.0";
    sha256 = "sha256-6gd7Kxo94v3dKpQEGzQSSDooRs4Nhtti1mRsA0XgThg=";
  }
  {
    name = "svelte-intellisense";
    publisher = "ardenivanov";
    version = "0.7.1";
    sha256 = "sha256-/AiGMgwCeD9B3y8LxTe6HoIswLuCnLbmwV7fxwfWSLw=";
  }
  {
    name = "html-css-class-completion";
    publisher = "Zignd";
    version = "1.20.0";
    sha256 = "3BEppTBc+gjZW5XrYLPpYUcx3OeHQDPW8z7zseJrgsE=";
  }
  # Linters
  {
    name = "vscode-htmlhint";
    publisher = "htmlhint";
    version = "1.0.5";
    sha256 = "sha256-LEgKH3FhKQJG1bpKxlHidaY86OqWRMpM0x92B3y8OR0=";
  }
  {
    name = "vs-code-prettier-eslint";
    publisher = "rvest";
    version = "6.0.0";
    sha256 = "sha256-PogNeKhIlcGxUKrW5gHvFhNluUelWDGHCdg5K+xGXJY=";
  }
  {
    name = "code-spell-checker-russian";
    publisher = "streetsidesoftware";
    version = "2.2.2";
    sha256 = "sha256-O/NPuehch2Iub4PJYubka06jQaR8jv0BOMuUfBZhuqY=";
  }
  # Other
  {
    name = "markdown-pdf";
    publisher = "yzane";
    version = "1.5.0";
    sha256 = "sha256-aiifZgHXC4GUEbkKAbLc0p/jUZxp1jF/J1Y/KIyvLIE=";
  }
  {
    name = "vscode-gutter-preview";
    publisher = "kisstkondoros";
    version = "0.31.2";
    sha256 = "sha256-2/RvDSsVL06UmNG9HchXaJMJ4FYtnpuJ2Bn53JVv1t8=";
  }
  {
    name = "gremlins";
    publisher = "nhoizey";
    version = "0.26.0";
    sha256 = "sha256-ML04SccSOrj5qY0HHJ5jiNbWkPElU1+zZNSX2i1K2uk=";
  }
  {
    name = "regexp-preview";
    publisher = "louiswt";
    version = "0.1.5";
    sha256 = "sha256-AW8y4lGz4ccHdRUbI1FM7zJaKi2A/+6jvTDOUFmzbGs=";
  }
  {
    name = "rainglow";
    publisher = "daylerees";
    version = "1.5.2";
    sha256 = "sha256-1c/xQYnuJ3BkwfqjMeT2kG1ZsXyjEOypJs0pJbouZMQ=";
  }
  {
    name = "jsoncrack-vscode";
    publisher = "aykutsarac";
    version = "2.0.3";
    sha256 = "sha256-YmVMeE5yWZ7vrQmyDJKk/LgqYhFQFIPLf0bRYV5PRF0=";
  }
  {
    name = "apc-extension";
    publisher = "drcika";
    version = "0.3.9";
    sha256 = "VMUICGvAFWrG/uL3aGKNUIt1ARovc84TxkjgSkXuoME=";
  }
  #? Corner cases
  # {
  #   name = "vscode-nginx-conf";
  #   publisher = "ahmadalli";
  #   version = "0.3.5";
  #   sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE=";
  # }
  # {
  #   name = "nginx-formatter";
  #   publisher = "raynigon";
  #   version = "0.0.13";
  #   sha256 = "sha256-pehpoX3reGE7Y4jXLTuyRSIKZRYuragI0GUIwJf7o0I=";
  # }
  # {
  #   name = "vscode-nginx";
  #   publisher = "william-voyek";
  #   version = "0.7.2";
  #   sha256 = "sha256-mAmncewwAeagVqwWWrmYosMyw2AT3W0sx8jl2mCeimg=";
  # }
]
