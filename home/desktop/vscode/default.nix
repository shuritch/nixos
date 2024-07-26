{
  imports = [ ./extensions.nix ./bindings.nix ./settings.nix ];
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true;
    enableUpdateCheck = false;
  };
}
