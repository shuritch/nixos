{ pkgs, lib, config, ... }: {
  config = lib.mkIf (builtins.elem "k8s-devkit" config.my.system.roles) {
    environment.systemPackages = with pkgs; [
      kubectl
      kubectx
      kubetail
      kubent
      lens
      kubernetes-helm
      minikube
    ];
  };
}
