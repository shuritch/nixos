
{ config, pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
  });
in
{
  imports = [ nixvim.nixosModules.nixvim ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    
    plugins = {
      lsp-format.enable = true;
      nvim-autopairs.enable = true;

      lualine = {
	enable = true;
	#componentSeparators = {
	#  left = "";
	#  tight = "";
	#};
        #sectionSeparators = {
	#  left = "";
	#  right = "";
	#};
	#sections = {
	#  lualine_c = "filename";
	#  lualine_x = "filetype";
	#};
      };

      which-key = {
	enable = true;
	#icons.separaor = "";
      };

      nvim-tree = {
	enable = true;
	hijackNetrw = false;
        git = {
	  enable = true;
	  ignore = false;
	};
      };

      oil = {
	enable = true;
	viewOptions.showHidden = true;
	columns = {
	  icon.enable = true;
	  permissions.enable = true;
	  size.enable = true;
	  mtime.enable = true;
	};
      };

      telescope = {
	enable = true;
	extensions = {
	  fzf-native = {
	    enable = true;
	    fuzzy = true;
	    overrideFileSorter = true;
	    overrideGenericSorter = true;
	    caseMode = "smart_case";
	  };
	};
      };

      treesitter = {
	enable = true;
	indent = true;
	incrementalSelection.enable = true;
      };
      
      nvim-cmp = {
        enable = true;
	autoEnableSources = true;

	mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_next_item()";
          };
          "<S-Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_prev_item()";
          };
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

	sources = [
          { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	  { name = "emoji"; }
	  { name = "nerdfont"; }
	  { name = "cmp_tabnine"; }
	];
      };

      lsp = {
        enable = true;
	servers = {
          svelte.enable = true;
	  tsserver.enable = true;
	  lua-ls.enable = true;
	  nil_ls.enable = true;
	  cmake.enable = true;
	  gopls.enable = true;
	  yamlls.enable = true;
          denols.enable = true;
          #templ.enable = true;
	  jsonls.enable = true;
	  #htmx.enable = true;
          html.enable = true;
	  #graphql.enable = true;
	  #dockerls.enable = true;
	  cssls.enable = true;
	  eslint.enable = true;
	  rust-analyzer = {
            enable = true;
	    installCargo = true;
	    installRustc = true;
            installLanguageServer = true;
	  };
	};
      };
    };

    options = {
      shiftwidth = 2;
      number = true;
      relativenumber = true;
    };
  };
}
