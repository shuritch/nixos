{ config, ... }:

let colors = config.my.home.colorscheme.base16colors;
in {
  programs.yazi.theme.filetype = {
    rules = [
      # Images and videos
      {
        mime = "image/*";
        fg = colors.base0F;
      }
      {
        mime = "video/*";
        fg = colors.base0F;
      }
      {
        mime = "audio/*";
        fg = colors.base0F;
      }

      # Archives
      {
        mime = "application/zip";
        fg = colors.base0F;
      }
      {
        mime = "application/gzip";
        fg = colors.base0F;
      }
      {
        mime = "application/x-tar";
        fg = colors.base0F;
      }
      {
        mime = "application/x-bzip";
        fg = colors.base0F;
      }
      {
        mime = "application/x-bzip2";
        fg = colors.base0F;
      }
      {
        mime = "application/x-7z-compressed";
        fg = colors.base0F;
      }
      {
        mime = "application/x-rar";
        fg = colors.base0F;
      }

      # Fallback
      {
        name = "*";
        fg = colors.base0F;
      }
      {
        name = "*/";
        fg = colors.base09;
      }
    ];
  };
}
