{ config, pkgs, ... }:

{
  users.users.sashapop10 = {
    isNormalUser = true;
    description = "Alexander Ivanov";
    extraGroups = [ "docker" "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      hunspellDicts.ru_RU
      telegram-desktop
      libreoffice-qt
      thunderbird
      lightly-qt
      flameshot
      hunspell
      chromium
      discord
      pgadmin
      #postman
      firefox
      anydesk
      vscode
      brave
      gimp
      kate
      vlc      

      rust-analyzer
      rustfmt
      rustup
      rustc
      cargo
      cargo-edit
      cargo-watch
      cargo-show-asm

      nodejs_latest
      nodejs_latest.pkgs.dockerfile-language-server-nodejs
      nodejs_latest.pkgs.pnpm
      nodejs_latest.pkgs.yarn
      nodejs_latest.pkgs.prettier
      nodejs_latest.pkgs."@prisma/language-server"
      nodejs_latest.pkgs.typescript-language-server
      nodejs_latest.pkgs.vscode-langservers-extracted
      pkgs.nodePackages.npm-check-updates
    ];
  };
}
