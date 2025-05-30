{
  # substituters to use
  nix.settings = {
    substituters = [
      "https://shuritch-nixos.cachix.org" # My cache
      "https://cache.nixos.org" # Funny binary cache
      "https://nix-community.cachix.org" # Nix-community cache
      "https://cache.privatevoid.net" # For nix-super
      "https://nixpkgs-wayland.cachix.org" # Automated builds of *some* wayland packages
      "https://hyprland.cachix.org" # Hyprland
      "https://nixpkgs-unfree.cachix.org" # Unfree-package cache
      "https://numtide.cachix.org" # Another unfree package cache
      "https://anyrun.cachix.org" # Anyrun program launcher
      "https://nyx.cachix.org" # Cached stuff from my flake outputs
      "https://neovim-flake.cachix.org" # A cache for my neovim flake
      "https://ags.cachix.org" # Ags
    ];

    trusted-public-keys = [
      "shuritch-nixos.cachix.org-1:zyYff3kQmaqUMIpKT1epk2Opzuo8htxFDo94hHUNixM="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "nyx.cachix.org-1:xH6G0MO9PrpeGe7mHBtj1WbNzmnXr7jId2mCiq6hipE="
      "neovim-flake.cachix.org-1:iyQ6lHFhnB5UkVpxhQqLJbneWBTzM8LBYOFPLNH4qZw="
      "notashelf.cachix.org-1:VTTBFNQWbfyLuRzgm2I7AWSDJdqAa11ytLXHBhrprZk="
      "cache.notashelf.dev-1:DhlmJBtURj+XS3j4F8SFFukT8dYgSjtFcd3egH8rE6U="
      "ags.cachix.org-1:naAvMrz0CuYqeyGNyLgE010iUiuf/qx6kYrUv3NwAJ8="
    ];
  };
}
