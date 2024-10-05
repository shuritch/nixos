{ lib, ... }: {
  imports = [ ./amd.nix ./intel.nix ./nvidia.nix ];
  options.my.hardware.gpu = lib.mkOption {
    type = with lib.types;
      nullOr (enum [ "amd" "intel" "nvidia" "hybrid-nvidia" "hybrid-amd" ]);
    description = "The manufacturer of the primary system gpu.";
    default = null;
  };

  # nix-shell -p lshw --run 'lshw -c display'
  options.my.hardware.nvidiaPrime = {
    nvidiaBusId = lib.mkOption {
      type = lib.types.str;
      default = "";
    };

    intelBusId = lib.mkOption {
      type = lib.types.str;
      default = "";
    };

    amdgpuBusId = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };
}
