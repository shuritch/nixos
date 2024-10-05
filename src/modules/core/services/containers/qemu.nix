{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.qemu.enable = lib.mkEnableOption "Enable qemu.";
  config = lib.mkIf cfg.qemu.enable {
    virtualisation = {
      kvmgt.enable = true;
      spiceUSBRedirection.enable = true;
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = with pkgs; [ OVMFFull.fd ];
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      virt-manager
      spice-gtk
      swtpm
      virt-viewer
    ];
  };
}
