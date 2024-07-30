{ inputs, config, ... }:

let inherit (config.colorscheme) colors harmonized;
in {
  home.sessionVariables.EDITOR = "nvim";
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymaps.nix
    ./plugins
    ./xdg.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.base16 = {
      enable = true;
      colorscheme = {
        base00 = "${colors.surface}"; # bg
        base01 = "${colors.surface_variant}"; # bg alt 1
        base02 = "${colors.tertiary_container}"; # bg alt 2
        base03 = "${colors.primary_container}"; # bright bg
        base04 = "${colors.on_surface_variant}"; # fg alt 1
        base05 = "${colors.on_surface}"; # fg
        base06 = "${colors.on_tertiary_container}"; # fg alt 2
        base07 = "${colors.on_primary_container}"; # bright fg
        base08 = "${harmonized.red}"; # red
        base09 = "${colors.primary}"; # accent 1
        base0A = "${harmonized.yellow}"; # yellow
        base0B = "${harmonized.green}"; # green
        base0C = "${harmonized.cyan}"; # cyan
        base0D = "${harmonized.blue}"; # blue
        base0E = "${harmonized.magenta}"; # magenta
        base0F = "${colors.error}"; # accent 2
      };
    };

    opts = {
      updatetime = 100; # Faster completion
      relativenumber = true; # Relative line numbers
      number = true; # Display the absolute line number of the current line
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one
      swapfile = false; # Disable the swap file
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search
      inccommand = "split";
      ignorecase = true;
      smartcase = true;
      scrolloff = 12; # Number of screen lines to show around the cursor
      cursorline = false; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = "100"; # Columns to highlight
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = false; # Disables 24-bit RGB color in the |TUI|
      spell = true; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping
      tabstop = 2; # Number of spaces a <Tab>
      shiftwidth = 2; # Number of spaces used for each step
      expandtab = true; # Expand <Tab> to spaces in Insert mode
      autoindent = true; # Do clever autoindenting
      textwidth = 0; # Maximum width of text that is being inserted.
      foldlevel = 99; # Folds
      completeopt = [ "menu" "menuone" "noselect" ]; # For CMP plugin
    };
  };
}
