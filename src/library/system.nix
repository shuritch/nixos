{ inputs, lib, ... }:

with lib; rec {
  selfRef = name: value: value // { ${name} = value; };

  mkSourcePath = hostname:
    let
      path = ../../cluster/${hostname};
      default = lib.path.append path "default.nix";
      config = lib.path.append path "configuration.nix";
    in if lib.pathExists then default else config;

  mkSystem = hostName:
    { roles ? [ ], class ? "desktop", admin ? "nixos", platform ? "x86_64-linux"
    , source ? mkSourcePath hostName, extraArguments ? { }, origin ? "23.05"
    , home-manager ? false }:

    lib.nixosSystem {
      specialArgs = selfRef "myExtraArgs" extraArguments // {
        myRoles = roles;
        myClass = class;
      };

      modules = concatLists [
        [ source ../modules/core ../modules/roles ../modules/class ]

        (if home-manager then
          [ ../modules/home ]
        else [{
          options.home-manager = extraArguments.myLib.mkStubOption "HM";
        }])

        (singleton {
          system.stateVersion = origin;
          networking.hostName = hostName;
          nixpkgs.hostPlatform = mkDefault platform;
          my.system = { inherit class admin roles; };
        })

        (optionals (class == "iso") [
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
        ])
      ];
    };

  pkgsForSys = f: lib.genAttrs (import inputs.systems) (sys: f pkgsFor.${sys});
  pkgsFor = lib.genAttrs (import inputs.systems) (system:
    import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
}
