{
  description = "<Shuritch NixOS configuration>";

  inputs = {
    ###################### NixOS / HM #######################
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ####################### Utilities #######################
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    # Plugins built for source
    snacks-nvim.url = "github:folke/snacks.nvim";
    snacks-nvim.flake = false;
  };

  outputs = inputs:
    let
      inherit (inputs.self) outputs;
      lib = inputs.nixpkgs.lib // inputs.home-manager.lib;
      myLib = import ./src/library { inherit inputs lib; };
      inherit (myLib) pkgsForSys mkSystem;
    in {
      packages = pkgsForSys (pkgs: import ./src/packages { inherit pkgs lib; });
      checks = pkgsForSys (pkgs: import ./hooks.nix { inherit inputs pkgs; });
      overlays = import ./src/overlays { inherit inputs outputs lib; };
      devShells = pkgsForSys (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = pkgsForSys (pkgs: pkgs.nixfmt-classic);
      templates = import ./src/templates;

      /* *                                       * *\
         Yes i know i can do it automatically with
         `builtins.readDir ./cluster` but i prefer
         to do this manually, as it is more clear.
      */

      nixosConfigurations.codex = mkSystem "codex" {
        extraArguments = { inherit myLib inputs outputs; };
        source = ./cluster/codex/configuration.nix;
        roles = [ "nodejs-devkit" "k8s-devkit" ];
        platform = "x86_64-linux";
        home-manager = true;
        admin = "shuritch";
        class = "desktop";
        origin = "24.11";
      };

      nnixosConfigurations.atlas = mkSystem "atlas" {
        extraArguments = { inherit myLib inputs outputs; };
        source = ./cluster/atlas/configuration.nix;
        roles = [ "nodejs-devkit" "k8s-devkit" ];
        platform = "x86_64-linux";
        home-manager = true;
        admin = "chief";
        class = "desktop";
        origin = "23.11";
      };

      nixosConfigurations.hermes = mkSystem "hermes" {
        extraArguments = { inherit myLib inputs outputs; };
        source = ./cluster/hermes/configuration.nix;
        roles = [ "nodejs-devkit" "python-devkit" ];
        platform = "x86_64-linux";
        home-manager = true;
        admin = "shuritch";
        class = "laptop";
        origin = "24.05";
      };

      nixosConfigurations.pandora = mkSystem "pandora" {
        extraArguments = { inherit myLib inputs outputs; };
        source = ./cluster/pandora/configuration.nix;
        roles = [ "headless" ];
        platform = "x86_64-linux";
        home-manager = false;
        admin = "nixos";
        class = "iso";
        origin = "24.05";
      };
    };
}
