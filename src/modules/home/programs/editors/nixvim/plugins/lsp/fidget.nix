{ config, lib, ... }:

# Ui notifications
# https://github.com/j-hui/fidget.nvim
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.fidget = lib.mkIf cfg.enable {
    enable = true;
    logger = {
      level = "warn";
      floatPrecision = 1.0e-2; # Float digits
    };

    progress = {
      pollRate = 0; # How and when to poll for progress messages
      suppressOnInsert = true; # Suppress new messages while in insert mode
      ignoreDoneAlready = false; # Ignore new tasks that are already complete
      ignoreEmptyMessage = false; # Ignore new tasks that empty

      # Clear notification group when LSP server detaches
      clearOnDetach = ''
        function(client_id)
          local client = vim.lsp.get_client_by_id(client_id)
          return client and client.name or nil
        end
      '';

      # How to get a progress message's notification group key
      notificationGroup = ''
        function(msg) return msg.lsp_client.name end
      '';

      ignore = [ ]; # List of LSP servers to ignore
      lsp.progressRingbufSize = 0; # LSP progress ring buffer size

      display = {
        overrides.rust_analyzer.name = "rust-analyzer";
        renderLimit = 16; # How many LSP messages to show at once
        doneTtl = 3; # How long a message should persist after completion
        doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
        doneStyle = "Constant"; # Highlight group for completed LSP tasks
        iconStyle = "Question"; # Highlight group for group icons
        skipHistory = true; # Progress notes should be omitted from history
        priority = 30; # Ordering priority for LSP notification group
        groupStyle = "Title"; # Highlight group for group name (LSP server name)
        progressTtl = "math.huge"; # In progress message live timeout
        progressStyle = "WarningMsg"; # Highlight group for progress LSP tasks
        progressIcon = { # Icon shown when LSP progress tasks are in progress
          pattern = "dots";
          period = 1;
        };

        # How to format a progress message
        formatMessage = ''
          require ("fidget.progress.display").default_format_message
        '';

        # How to format a progress annotation
        formatAnnote = ''
          function (msg) return msg.title end
        '';

        # How to format a progress notification group's name
        formatGroupName = ''
          function (group) return tostring (group) end
        '';
      };
    };

    notification = {
      filter = "info";
      pollRate = 10; # How frequently to update and render notifications
      historySize = 128; # Number of removed messages to retain in history
      configs.default = "require('fidget.notification').default_config";
      overrideVimNotify = true;
      redirect = ''
        function(msg, level, opts)
          if opts and opts.on_open then
            return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
          end
        end
      '';

      window = {
        normalHl = "Comment";
        winblend = 0;
        border = "none"; # none, single, double, rounded, solid, shadow
        zindex = 45;
        maxWidth = 0;
        maxHeight = 0;
        xPadding = 1;
        yPadding = 0;
        align = "bottom";
        relative = "editor";
      };

      view = {
        stackUpwards = true; # Display notification items from bottom to top
        iconSeparator = " "; # Separator between group name and icon
        groupSeparator = "---"; # Separator between notification groups
        groupSeparatorHl = "Comment"; # Highlight group used for group separator
      };
    };
  };
}
