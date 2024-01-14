<h1 align="center">
    My NIXOS Setup with tooling and guides
</h1>

<h2 align="center">
    Installation
</h2>

```bash
  # Clone directly
  chown -R <user> /etc/nixos
  git clone https://github.com/sashapop10/nixos /etc/nixos/
  # If system not installed
  sudo nixos-install
  # Build & switch
  sudo nixos-rebuild --upgrade build
  sudo nixos-rebuild switch
```

<h2 align="center">
    Rare possibilities
</h2>

### temporal environment packages

```bash
  # Install temporal package
  nix-env -iA packageName
  # List of temporal packages
  nix-env -q
  # Remove temporal package
  nix-env --uninstall packageName
```

### Nix

#### Variables

```nix
  let
    user="sashapop10"
  in
  {
    # Can be used here
  }
```

#### Functions

```nix
  let myfunc = { a ? 100, b, ... }@args: a + b;
  in myfunc { b = 15; c = true }; # 115
```

#### Logical

```nix
  let myfunc = { a ? 100, b, ... }@args:
  if args.c then a else b;
  in myfunc { b = 15; c = true } # 100
```

### Overlays / Replacing package

```nix
{
  nixpkgs.overlays = [
    # Example 1
    (self: super: {
      sl = super.sl.overrideAttrs (old: {
        src = super.fetchFromGithub {
          owner = "";
          repo = "";
          rev = "";
          sha256 = "";
        }
      })
    })

    #Example 2
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: { src = builtins.fetchTarball {
          url = "https://discord.com/api/download?platform=linux&format=tar.gz";
          sha256 = "";
        }; }
      )
    })
  ];
}
```

<p align="center">
Copyright © 2023 <a href="https://github.com/sashapop10">sashapop10</a>.<br/>
This package is <a href="./LICENSE">MIT licensed</a>.<br/>
</p>
