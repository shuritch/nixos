{
  description = "<My NixOS configuration>";

  inputs = {
    #################### Official NixOS and HM Package Sources ####################
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos/nixos-hardware";
    #################### Utilities ####################
    nix-gl.url = "github:nix-community/nixgl";
    nix-gl.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      configs = import ./hosts { inherit inputs outputs lib; };
    in {
      inherit lib;
      overlays = import ./library/overlays { inherit inputs outputs; };
      devShells = configs.forSys (pkgs: import ./shell.nix { inherit pkgs; });
      packages = configs.forSys (pkgs: import ./library/pkgs { inherit pkgs; });
      homeManagerModules = import ./library/modules/home;
      nixosModules = import ./library/modules/global;
      formatter = configs.forSys (pkgs: pkgs.nixfmt-classic);
      nixosConfigurations = configs.hosts;
      homeConfigurations = configs.homes;
    };
}
