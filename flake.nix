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

  outputs = { self, nixpkgs, home-manager, systems, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      vars = import ./library/vars { inherit inputs outputs lib; };
      admin = vars.admin.login;
      specialArgs = { inherit vars inputs outputs; };
      forSys = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit lib;
      overlays = import ./library/overlays { inherit inputs outputs; };
      devShells = forSys (pkgs: import ./shell.nix { inherit pkgs; });
      packages = forSys (pkgs: import ./library/pkgs { inherit pkgs; });
      homeManagerModules = import ./library/modules/home;
      nixosModules = import ./library/modules/global;
      formatter = forSys (pkgs: pkgs.nixfmt-classic);

      nixosConfigurations.atlas = lib.nixosSystem {
        modules = [ ./core/hosts/atlas ];
        specialArgs = specialArgs;
      };

      nixosConfigurations.hermes = lib.nixosSystem {
        modules = [ ./core/hosts/hermes ];
        specialArgs = specialArgs;
      };

      homeConfigurations."${admin}@atlas" = lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        modules = [ ./home/standalone.nix ./home/hosts/atlas.nix ];
        pkgs = pkgsFor.x86_64-linux;
      };

      homeConfigurations."${admin}@hermes" = lib.homeManagerConfiguration {
        extraSpecialArgs = specialArgs;
        modules = [ ./home/standalone.nix ./home/hosts/hermes.nix ];
        pkgs = pkgsFor.x86_64-linux;
      };
    };
}
