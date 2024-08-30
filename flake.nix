{
  description = "<My NixOS configuration>";

  inputs = {
    #################### Official NixOS and HM Package Sources ####################
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
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

  outputs = { self, nixpkgs, home-manager, systems, ... }@inputs:
    let
      inherit (self) outputs;
      inherit (configs) hosts homes myLib;
      lib = nixpkgs.lib // home-manager.lib;
      configs = import ./hosts { inherit inputs outputs lib; };
      forSys = f: lib.genAttrs (import systems) (sys: f myLib.pkgsFor.${sys});
    in {
      inherit lib;
      packages = forSys (pkgs: import ./library/pkgs { inherit pkgs; });
      overlays = import ./library/overlays { inherit inputs outputs; };
      devShells = forSys (pkgs: import ./shell.nix { inherit pkgs; });
      homeManagerModules = import ./library/modules/home;
      nixosModules = import ./library/modules/core;
      formatter = forSys (pkgs: pkgs.nixfmt-classic);
      nixosConfigurations = hosts;
      homeConfigurations = homes;
    };
}
