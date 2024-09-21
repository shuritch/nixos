{ lib, config, ... }:
let cfg = config.shell;
in {
  options.shell = {
    aliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      description = "Shell abbreviations";
      default = { };
    };

    abbrs = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      description = "Shell abbreviations";
      default = { };
    };

    enableBashIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Bash integration.
      '';
    };

    enableZshIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Zsh integration.
      '';
    };

    enableFishIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Fish integration.
      '';
    };

    enableNushellIntegration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = ''
        Whether to enable Nushell integration.
      '';
    };
  };

  config.programs.fish = lib.mkIf cfg.enableFishIntegration {
    shellAliases = cfg.aliases;
    shellAbbrs = cfg.abbrs;
  };

  config.programs.nushell = lib.mkIf cfg.enableNushellIntegration {
    shellAliases = cfg.aliases // cfg.abbrs;
  };

  config.programs.zsh = lib.mkIf cfg.enableZshIntegration {
    shellAliases = cfg.aliases;
    zsh-abbr = {
      enable = true;
      abbreviations = cfg.abbrs;
    };
  };

  config.programs.bash = lib.mkIf cfg.enableBashIntegration {
    shellAliases = cfg.aliases // cfg.abbrs;
  };

  config.shell.aliases = {
    # Clear screen and scrollback
    c = "printf '\\033[2J\\033[3J\\033[1;1H'";
    clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
  };

  config.shell.abbrs = let
    inherit (lib) mkIf;
    packageNames = map (p: p.pname or p.name or null) config.home.packages;
    hasPackage = name: lib.any (x: x == name) packageNames;
    hasSpecialisationCli = hasPackage "specialisation";
    hasKitty = config.programs.kitty.enable;
    hasEza = hasPackage "eza";
  in {
    nix-rebuild = "sudo nixos-rebuild --flake $FLAKE";
    nix-switch = "sudo nixos-rebuild --flake $FLAKE switch";
    nix-clean = "sudo nix-collect-garbage -d";
    nix-test = "sudo nixos-rebuild --flake $FLAKE test";
    home-rebuild = "home-manager --flake $FLAKE";
    home-switch = "home-manager --flake $FLAKE switch";
    nix-edit = "code $FLAKE";

    v = "nvim";
    vim = "nvim";
    js = "node";
    dsize = "du -hs";

    htop = mkIf (hasPackage "btop") "btop";
    cat = mkIf (hasPackage "bat") "bat";
    space = mkIf (hasPackage "ncdu") "ncdu";
    cd = mkIf (hasPackage "zoxide") "z";
    s = mkIf hasSpecialisationCli "specialisation";
    cik = mkIf hasKitty "clone-in-kitty --type os-window";

    ls = mkIf hasEza "eza";
    exa = mkIf hasEza "eza";
    l = mkIf hasEza "eza --icons  -a --group-directories-first -1";
    tree = mkIf hasEza "eza --icons --tree --group-directories-first";
    ll = mkIf hasEza
      "eza --icons  -a --group-directories-first -1 --no-user --long";
  };
}
