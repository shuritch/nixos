{ pkgs, ... }: {
  imports = [ ./git ./shell ./tweaks ./scripts ];
  home.packages = with pkgs; [
    stable.nixfmt-classic # Nix formatter
    nixd # Nix Language server
    nvd # Differ
    nix-diff # Better differ
    nix-output-monitor # Better Nix build output
    ltex-ls # Spell checking LSP
  ];
}
