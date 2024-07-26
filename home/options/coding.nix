{ pkgs, ... }: {
  # insecure-coding = [ "python-2.7.18.8" "electron-25.9.0" ];
  home.packages = with pkgs; [
    python
    cmake
    gcc
    chromium
    bun
    nodejs_latest
    nodejs_latest.pkgs.dockerfile-language-server-nodejs
    nodejs_latest.pkgs.pnpm
    nodejs_latest.pkgs.yarn
    nodejs_latest.pkgs.prettier
    nodejs_latest.pkgs."@prisma/language-server"
    nodejs_latest.pkgs.typescript-language-server
    nodejs_latest.pkgs.vscode-langservers-extracted
    pkgs.nodePackages.npm-check-updates
    docker-compose
    act
  ];
}
