{ pkgs, lib, config, ... }: {
  config = lib.mkIf (builtins.elem "nodejs-devkit" config.my.system.roles) {
    environment.systemPackages = with pkgs; [
      gnumake
      chromium
      bun
      shfmt

      typescript
      nest-cli

      nodejs_latest
      nodejs_latest.pkgs.prettier
      nodejs_latest.pkgs.yarn
      nodejs_latest.pkgs.pnpm
      nodejs_latest.pkgs.typescript-language-server
      nodejs_latest.pkgs.vscode-langservers-extracted
      nodejs_latest.pkgs.dockerfile-language-server-nodejs
      nodejs_latest.pkgs.npm-check-updates

      mkcert
      act
    ];
  };
}
