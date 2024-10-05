{ pkgs, config, lib, ... }:

let cfg = config.my.hardware;
in {
  config = lib.mkIf
    (cfg.gpu != null && (cfg.gpu == "amd" || cfg.gpu == "hybrid-amd")) {
      services.xserver.videoDrivers = [ "modesetting" "amdgpu" ];
      environment.systemPackages = [ pkgs.nvtopPackages.amd ];

      boot = {
        initrd.kernelModules = [ "amdgpu" ];
        kernelModules = [ "amdgpu" ];
      };

      hardware.graphics = {
        extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
        extraPackages = [
          pkgs.amdvlk
          pkgs.mesa
          pkgs.vulkan-tools
          pkgs.vulkan-loader
          pkgs.vulkan-validation-layers
          pkgs.vulkan-extension-layer
        ] ++ (if pkgs ? rocmPackages.clr then
          with pkgs.rocmPackages; [ clr clr.icd ]
        else
          with pkgs; [ rocm-opencl-icd rocm-opencl-runtime ]);
      };
    };
}
