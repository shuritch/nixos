{
  description = "<My NixOS configuration>";

  inputs = {
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos/nixos-hardware";

    # Third party
    nix-colors.url = "github:misterio77/nix-colors";
    # impermanence.url = "github:nix-community/impermanence";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, systems, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      forSys = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit lib;
      overlays = import ./overlays { inherit inputs outputs; };
      devShells = forSys (pkgs: import ./shell.nix { inherit pkgs; });
      packages = forSys (pkgs: import ./pkgs { inherit pkgs; });
      formatter = forSys (pkgs: pkgs.nixfmt-classic);
      homeManagerModules = import ./modules/home;
      nixosModules = import ./modules/global;

      # TODO | nixos-rebuild --flake .#your-hostname
      nixosConfigurations = builtins.mapAttrs (name: _: {
        modules = [ ./nixos/hosts/${name} ];
        specialArgs = { inherit inputs outputs; };
      }) builtins.readDir ./nixos/hosts;

      # nixosConfigurations.atlas = lib.nixosSystem {
      #   modules = [ ./hosts/atlas ];
      #   specialArgs = { inherit inputs outputs; };
      # };

      # TODO | home-manager --flake .#your-username@your-hostname
      homeConfigurations."sashapop10@atlas" = lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [ ./home/standalone.nix ];
        pkgs = pkgsFor.x86_64-linux;
      };
    };
}
