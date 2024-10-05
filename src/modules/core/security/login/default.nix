{ lib, ... }: {
  imports = [ ./logind.nix ./greetd.nix ./sddm.nix ];
  options.my.security.login = lib.mkOption {
    description = "Choose preffered login manager";
    type = lib.types.enum [ "logind" "greetd" "sddm" ];
    default = "logind";
  };
}
