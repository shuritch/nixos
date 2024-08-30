{ pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    #? Seems broken for now...
    # rootless = {
    #   enable = true;
    #   setSocketVariable = true;
    # };
  };

  environment.systemPackages = with pkgs; [ docker-compose ];
}
