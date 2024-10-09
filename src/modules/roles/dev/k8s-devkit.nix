{ pkgs, lib, config, ... }: {
  config = lib.mkIf (builtins.elem "clang-devkit" config.my.system.roles) {
    environment.systemPackages = with pkgs; [
      kubectl
      kubectx
      kubetail
      kubent
      kubernetes-helm
      minikube
    ];
  };
}
