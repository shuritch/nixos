{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users.sashapop10 = {};
}