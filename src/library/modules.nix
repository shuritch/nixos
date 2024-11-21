{ lib, ... }:

with lib; rec {
  mkStubOption = description:
    lib.mkOption {
      inherit description;
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };

  mkServiceOption = { name, ... }@config:
    {
      enable = mkEnableOption "Enable the ${name} service";

      host = mkOption {
        description = "The host for ${name} service";
        default = config.host or "127.0.0.1";
        type = types.str;
      };

      port = mkOption {
        description = "The port for ${name} service";
        default = config.port or 0;
        type = types.port;
      };

      domain = mkOption {
        description = "Domain name for the ${name} service";
        default = config.domain or "";
        type = types.str;
      };
    } // (config.extraConfig or { });

  mkFontOption = kind: default: {
    name = lib.mkOption {
      type = lib.types.str;
      default = default.name or null;
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = default.package or null;
      description = "Package for ${kind} font profile";
      example = "pkgs.fira-code";
    };

    size = lib.mkOption {
      type = lib.types.int;
      default = default.size or 14;
      description = "Size in pixels for ${kind} font profile";
      example = "14";
    };
  };

  mkWaybarScript = pkgs:
    { name ? "script", deps ? [ ], script ? "", }:
    lib.getExe (pkgs.writeShellApplication {
      inherit name;
      text = script;
      runtimeInputs = (with pkgs; [ coreutils gnugrep systemd ]) ++ deps;
    });

  mkWaybarScriptJson = pkgs:
    { name ? "script", deps ? [ ], pre ? "", text ? "", tooltip ? "", alt ? ""
    , class ? "", percentage ? "", }:
    mkWaybarScript pkgs {
      inherit name;
      deps = [ pkgs.jq ] ++ deps;
      script = ''
        ${pre}
        jq -cn \
          --arg text "${text}" \
          --arg tooltip "${tooltip}" \
          --arg alt "${alt}" \
          --arg class "${class}" \
          --arg percentage "${percentage}" \
          '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
      '';
    };
}
