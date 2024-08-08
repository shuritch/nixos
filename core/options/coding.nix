{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python
    cmake
    gnumake
    gcc
    chromium
    bun
    nodejs_latest
    nodejs_latest.pkgs.yarn
    nodejs_latest.pkgs.pnpm
    nodejs_latest.pkgs.prettier
    nodejs_latest.pkgs."@prisma/language-server"
    nodejs_latest.pkgs.typescript-language-server
    nodejs_latest.pkgs.vscode-langservers-extracted
    nodejs_latest.pkgs.dockerfile-language-server-nodejs
    nodePackages.npm-check-updates
    docker-compose
    act
  ];
}
