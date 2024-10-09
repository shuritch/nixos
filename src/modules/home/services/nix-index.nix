{ pkgs, lib, config, ... }: {
  options.my.home.services.nix-index.enable =
    lib.mkEnableOption "Enable nix-index database.";

  config = lib.mkIf config.my.home.services.nix-index.enable {
    home.packages = with pkgs; [ comma ];
    programs.nix-index.enable = true;
    systemd.user.services.nix-index-database-sync = {
      Unit.Description = "Fetch mic92/nix-index-database";
      Service = {
        Type = "oneshot";
        Restart = "on-failure";
        RestartSec = "5m";
        ExecStart = lib.getExe (pkgs.writeShellApplication {
          name = "fetch-nix-index-database";
          runtimeInputs = with pkgs; [ wget coreutils ];
          text = ''
            mkdir -p ~/.cache/nix-index
            cd ~/.cache/nix-index
            name="index-${pkgs.stdenv.system}"
            wget -N "https://github.com/Mic92/nix-index-database/releases/latest/download/$name"
            ln -sf "$name" "files"
          '';
        });
      };
    };

    systemd.user.timers.nix-index-database-sync = {
      Unit.Description = "Automatic github:mic92/nix-index-database fetching";
      Install.WantedBy = [ "timers.target" ];
      Timer = {
        OnBootSec = "10m";
        OnUnitActiveSec = "24h";
      };
    };
  };
}
