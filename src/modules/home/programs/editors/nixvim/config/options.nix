{ config, ... }: {
  programs.nixvim.opts = {
    # Appearance
    guifont =
      "${config.my.home.desktop.fonts.monospace.name}:h14:Medium:i"; # fontname:fontsize
    guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,n-v-i:blinkon0";
    hidden = true; # Keep closed buffer open in the background
    laststatus = 0; # Display status line always
    termguicolors = true; # Enable 24-bit colors
    cursorline = false; # Highlight the line where the cursor is located
    showmode = true; # We don't need to see things like INSERT anymore
    showmatch = true; # highlight matching braces
    cmdheight = 0; # More space in the neovim cli for displaying messages
    # ruler = true; # show current line and column

    # Scroll
    scrolloff = 8; # Number of screen lines to show around the cursor
    sidescrolloff = 15;
    sidescroll = 1;

    # Enable relative line numbers
    number = true;
    relativenumber = true;

    # Number of spaces a <Tab>
    expandtab = true; # Expand <Tab> to spaces in Insert mode
    softtabstop = 2;
    showtabline = 0;
    tabstop = 2;

    # Indenting
    smartindent = true; # Enable auto indenting and set it to spaces
    autoindent = true; # Do clever autoindenting
    breakindent = true; # Enable smart indenting
    shiftwidth = 2; # Number of spaces used for each step
    wrap = false; # Enable text wrap
    # linebreak = true; # Wrap lines at convenient points
    cindent = true; # automatically indent braces
    smarttab = true;

    # Search
    hlsearch = true;
    incsearch = true;
    ignorecase = true;
    smartcase = true;
    inccommand = "split";
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # Better splitting
    splitbelow = true;
    splitright = true;

    # Mouse
    mouse = "a";
    mousemodel = "extend";

    # Enable persistent undo history
    swapfile = false;
    backup = false;
    autoread = true;
    undofile = true;

    # fold settings: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldnestmax = 3; # deepest fold is 3 levels
    foldlevelstart = 99;
    foldmethod = "expr";
    foldenable = true;
    foldcolumn = "0";
    foldlevel = 99;

    # Set encoding type
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Enable chars list
    list = true; # Show invisible characters (tabs, eol, ...)
    listchars =
      "eol:↲,tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";

    # Columns
    # signcolumn = "yes"; # Whether to show the signcolumn
    # colorcolumn = "100"; # Columns to highlight
    # cursorcolumn = false; # Highlight the screen column of the cursor

    # Other
    updatetime = 50; # faster completion (4000ms default)
    completeopt = [ "menuone" "noselect" "noinsert" ]; # CMP
    # completeopt = [ "menu" "menuone" "noselect" ]; # CMP
    timeoutlen = 10; # Reduce which-key timeout to 10ms
    spell = true; # Highlight spelling mistakes (local to window)
    lazyredraw = true; # Redraw only when needed
    visualbell = true; # No sounds

    # textwidth = 0; # Maximum width of text that is being inserted.
    # modeline = true; # Tags such as 'vim:ft=sh'
    # modelines = 100; # Sets the type of modelines
  };
}
