{ inputs, lib, ... }:

with lib; rec {
  selfRef = name: value: value // { ${name} = value; };
  mkSystem = hostName: cfg:
    lib.nixosSystem {
      specialArgs = selfRef "myExtraArgs" cfg.extraArguments // {
        myClass = cfg.class;
        myRoles = cfg.roles;
      };

      modules = concatLists [
        [ ../modules/core ../modules/home ../modules/roles ../modules/class ]
        (singleton (import ../../cluster/${hostName}))

        (singleton {
          networking.hostName = hostName;
          nixpkgs.hostPlatform = mkDefault cfg.platform;
          my.system = { inherit (cfg) class admin roles; };
        })

        (optionals (cfg.class == "iso") [
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
        ])
      ];
    };

  pkgsForSys = f: lib.genAttrs (import inputs.systems) (sys: f pkgsFor.${sys});
  forSys = f:
    lib.genAttrs (import inputs.systems) (system:
      f {
        pkgs = pkgsFor.${sys};
        inherit system;
      });

  pkgsFor = lib.genAttrs (import inputs.systems) (system:
    import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
}
