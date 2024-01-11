<h1 align="center">
    My NIXOS Setup with tooling and guides
</h1>

<h2 align="center">
    Installation
</h2>

```bash
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

### Variables

```nix
  let
    user="sashapop10"
  in
  {
    # Can be used here
  }
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
