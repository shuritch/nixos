let
  env-config = import ./env.nix;
  platform = env-config.platform;
  hostname = env-config.hostname;
  login = env-config.user.login;
  version = env-config.version;
in {
  description = "<My NixOS configuration>";

  inputs = {
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-${version}";
    home-manager.url = "github:nix-community/home-manager/release-${version}";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
      overlays = import ./overlays { inherit inputs outputs env-config; };
      packages = forSys (pkgs: import "./pkgs" { inherit pkgs; });
      devShells = forSys (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forSys (pkgs: pkgs.nixfmt-classic);

      # nixos-rebuild --flake .#your-hostname
      nixosConfigurations.${hostname} = lib.nixosSystem {
        specialArgs = { inherit inputs outputs env-config; };
        modules = [ ./global ];
      };

      # home-manager --flake .#your-username@your-hostname
      homeConfigurations."${login}@${hostname}" = lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs outputs env-config; };
        pkgs = nixpkgs.legacyPackages.${platform};
        modules = [ ./home ];
      };
    };
}
