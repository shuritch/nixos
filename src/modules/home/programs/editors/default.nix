{ config, lib, ... }:

let
  editor = if config.programs.nixvim.enable then
    "nvim"
  else if config.programs.micro.enable then
    "micro"
  else if config.programs.vscode.enable then
    "code"
  else
    "nano";
in {
  imports = [ ./nixvim ./vscode ./micro.nix ];
  home.sessionVariables = {
    VISUAL = editor;
    GIT_EDITOR = editor;
    SUDO_EDITOR = editor;
    EDITOR = editor;
  } // (lib.optionalAttrs config.programs.nixvim.enable {
    MANPAGER = "nvim +Man!";
  });

  xdg.mimeApps.inverted.defaultApplications = {
    "${editor}.desktop" = [
      "text/english"
      "text/plain"
      "text/x-makefile"
      "text/x-c++hdr"
      "text/x-c++src"
      "text/x-chdr"
      "text/x-csrc"
      "text/x-java"
      "text/x-moc"
      "text/x-pascal"
      "text/x-tcl"
      "text/css"
      "text/html"
      "text/javascript"
      "application/json"
      "text/x-tex"
      "application/x-shellscript"
      "text/x-c"
      "text/x-c++"
    ];
  };
}
