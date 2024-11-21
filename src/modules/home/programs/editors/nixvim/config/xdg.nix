{
  xdg.desktopEntries.nvim = {
    name = "Nixvim";
    terminal = true;
    type = "Application";
    categories = [ "Utility" "TextEditor" ];
    genericName = "Text Editor";
    comment = "Edit text files";
    exec = "nvim %F";
    icon = "nvim";
    mimeType = [
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
