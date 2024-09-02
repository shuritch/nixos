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
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, systems, flake-parts, ... }@inputs:
    let inherit (self) outputs;
    in flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./hosts ./hooks.nix ];
      systems = import systems;

      flake = {
        overlays = import ./library/overlays { inherit inputs outputs; };
        homeManagerModules = import ./library/modules/home;
        nixosModules = import ./library/modules/core;
      };

      perSystem = { pkgs, ... }: {
        packages = import ./library/pkgs { inherit pkgs; };
        devShells = import ./shell.nix { inherit pkgs; };
        formatter = pkgs.nixfmt-classic;
      };
    };
}
