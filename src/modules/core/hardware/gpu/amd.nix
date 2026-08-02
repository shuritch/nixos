{ lib, config, pkgs, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    # Defined in ./default.nix
  };

  config = lib.mkIf (cfg.gpu == "amd") {
    services.xserver.videoDrivers = [ "amdgpu" ];
    boot.kernelModules = [ "amdgpu" ];
    hardware.graphics.extraPackages = [
      # enables AMDVLK & OpenCL support
      pkgs.rocmPackages.clr
      pkgs.rocmPackages.clr.icd
    ];
  };
}
