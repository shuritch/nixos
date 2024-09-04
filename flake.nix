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
    flake-parts.url = "github:hercules-ci/flake-parts";
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
      lib = nixpkgs.lib // home-manager.lib;
      configs = import ./hosts { inherit inputs outputs lib pkgsFor; };
      forSys = f: lib.genAttrs (import systems) (sys: f pkgsFor.${sys});
      pkgsFor = lib.genAttrs (import inputs.systems) (system:
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit (configs) nixosConfigurations homeConfigurations;
      packages = forSys (pkgs: import ./library/pkgs { inherit pkgs lib; });
      overlays = import ./library/overlays { inherit inputs outputs; };
      devShells = forSys (pkgs: import ./shell.nix { inherit pkgs; });
      homeManagerModules = import ./library/modules/home;
      nixosModules = import ./library/modules/core;
      formatter = forSys (pkgs: pkgs.nixfmt-classic);
    };
}
