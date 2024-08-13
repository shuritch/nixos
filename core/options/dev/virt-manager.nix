{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ virt-manager spice-gtk swtpm ];
  security.polkit.enable = true;
  virtualisation = {
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
}
