{
  programs.nixvim.opts = {
    # Enable relative line numbers
    number = true;
    relativenumber = true;

    # Number of spaces a <Tab>
    expandtab = true; # Expand <Tab> to spaces in Insert mode
    tabstop = 2;
    softtabstop = 2;
    showtabline = 0;

    smartindent = true; # Enable auto indenting and set it to spaces
    shiftwidth = 2; # Number of spaces used for each step
    updatetime = 50; # faster completion (4000ms default)
    autoindent = true; # Do clever autoindenting

    breakindent = true; # Enable smart indenting
    wrap = true; # ? Enable text wrap
    completeopt = [ "menuone" "noselect" "noinsert" ]; # CMP
    # completeopt = [ "menu" "menuone" "noselect" ]; # CMP
    termguicolors = true; # Enable 24-bit colors
    cursorline = false; # Highlight the line where the cursor is located
    scrolloff = 8; # Number of screen lines to show around the cursor
    timeoutlen = 10; # Reduce which-key timeout to 10ms
    cmdheight = 0; # More space in the neovim cli for displaying messages
    showmode = true; # We don't need to see things like INSERT anymore
    spell = true; # Highlight spelling mistakes (local to window)

    # Columns
    # signcolumn = "yes"; # Whether to show the signcolumn
    # colorcolumn = "100"; # Columns to highlight
    # cursorcolumn = false; # Highlight the screen column of the cursor

    # Mouse
    mouse = "a";
    mousemodel = "extend";

    # Incremental search
    hlsearch = true;
    incsearch = true;

    # Better splitting
    splitbelow = true;
    splitright = true;
    inccommand = "split";

    # Set encoding type
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Enable ignorecase + smartcase for better searching
    smartcase = true; # Don't ignore case with capitals
    ignorecase = true;
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # Enable persistent undo history
    swapfile = false;
    backup = false;
    autoread = true;
    undofile = true;

    # fold settings: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # hidden = true; # Keep closed buffer open in the background

    # modeline = true; # Tags such as 'vim:ft=sh'
    # modelines = 100; # Sets the type of modelines

    # laststatus = 3; # When to use a status line for the last window
    # textwidth = 0; # Maximum width of text that is being inserted.
  };
}
