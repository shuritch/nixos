{ config, ... }: {
  # Security & Telemetry
  "telemetry.telemetryLevel" = "off";
  "security.workspace.trust.untrustedFiles" = "open";
  "redhat.telemetry.enabled" = false;
  "security.workspace.trust.banner" = "never";
  "security.workspace.trust.startupPrompt" = "never";
  "security.workspace.trust.enabled" = false;

  # Other
  "extensions.autoUpdate" = true;
  "extensions.ignoreRecommendations" = false;
  "window.customTitleBarVisibility" = "never";
  "window.openFoldersInNewWindow" = "on";
  "window.menuBarVisibility" = "hidden";
  "window.autoDetectColorScheme" = false;
  "window.titleBarStyle" = "native";
  # "window.restoreWindows"= "none";
  # "window.titleBarStyle"= "custom";
  "window.commandCenter" = true;
  "window.zoomLevel" = 2;
  "window.nativeTabs" = true;

  # Workbench
  # "zenMode.showTabs"= "none";
  "zenMode.centerLayout" = false;
  "git.enabled" = true;
  "git.autofetch" = true;
  "git.confirmSync" = false;
  "git.suggestSmartCommit" = false;

  # "workbench.editor.showTabs" = "none"; # Distructed
  "workbench.editor.showTabs" = "single";
  # "workbench.statusBar.visible" = false;
  "workbench.iconTheme" = "material-icon-theme";
  "workbench.colorTheme" = "Blink Contrast (rainglow)";
  "material-icon-theme.activeIconPack" = "angular_ngrx";
  "workbench.startupEditor" = "readme"; # newUntitledFile
  "workbench.list.smoothScrolling" = true;
  "workbench.layoutControl.enabled" = false;
  "workbench.editor.enablePreviewFromQuickOpen" = true;
  #   "workbench.editor.editorActionsLocation": "titleBar",
  # "workbench.editor.limit.enabled": true,
  # "workbench.editor.limit.excludeDirty": true,
  # "workbench.editor.limit.value": 5,
  # "workbench.enableExperiments": false,
  "workbench.statusBar.feedback.visible" = false;
  "workbench.panel.defaultLocation" = "right";
  "workbench.sideBar.location" = "left";
  "workbench.activityBar.location" = "hidden";

  # Terminal
  "terminal.integrated.enableMultiLinePasteWarning" = false;
  "terminal.integrated.fontFamily" = config.fontProfiles.monospace.family;
  "terminal.integrated.smoothScrolling" = true;
  "terminal.integrated.defaultProfile.osx" = "/bin/fish";
  "terminal.integrated.defaultProfile.linux" = "fish";
  "terminal.integrated.tabs.enabled" = false;
  "terminal.integrated.lineHeight" = 1;
  "terminal.integrated.fontSize" = 14;
  "terminal.integrated.persistentSessionScrollback" = 0;
  "terminal.integrated.scrollback" = 100000000;
  "terminal.integrated.env.linux" = { };
  "terminal.integrated.env.windows" = { };

  # Explorer
  "explorer.fileNesting.patterns" = import ./nest.nix;
  "files.exclude" = import ./exclude.nix;
  "explorer.sortOrder" = "default";
  "explorer.confirmDragAndDrop" = false;
  "explorer.confirmDelete" = false;
  "explorer.compactFolders" = false;
  "explorer.autoReveal" = true;
  "explorer.fileNesting.enabled" = true;
  "explorer.fileNesting.expand" = false;
  "explorer.autoRevealExclude" = {
    "**/node_modules" = true;
    "**/build" = true;
    "**/dist" = true;
  };

  # Editor
  "files.eol" = "\n";
  "editor.codeLens" = false;
  "editor.unicodeHighlight.nonBasicASCII" = false;
  "editor.formatOnPaste" = false;
  "editor.formatOnType" = false;
  "editor.formatOnSave" = true;
  "editor.defaultFormatter" = "esbenp.prettier-vscode";
  "editor.fontFamily" = config.fontProfiles.monospace.family;
  "editor.stickyScroll.enabled" = true;
  "editor.cursorSmoothCaretAnimation" = "on";
  "editor.smoothScrolling" = true;
  "editor.tabSize" = 2;
  "editor.cursorBlinking" = "expand";
  "editor.cursorStyle" = "line";
  "editor.minimap.renderCharacters" = false;
  "editor.minimap.scale" = 3;
  "editor.minimap.autohide" = true;
  "editor.wordWrap" = "off";
  "editor.autoIndent" = "full";
  "editor.fontLigatures" = true;
  # "editor.lineNumbers"= "relative";
  #"editor.minimap.enabled"= false;
  "editor.fontSize" = 14;
  "editor.lineHeight" = 20;
  "editor.fontWeight" = "400";
  "editor.linkedEditing" = true;
  "editor.mouseWheelZoom" = false;
  "editor.inlineSuggest.enabled" = false;
  "editor.suggest.insertMode" = "replace";
  "editor.insertSpaces" = true;
  "editor.largeFileOptimizations" = false;
  # "editor.letterSpacing" = 0.5;
  "editor.renderWhitespace" = "all";
  "editor.suggestSelection" = "first";
  "editor.tabCompletion" = "on";
  "editor.wordSeparators" = ''/\()"':,.;<>~!@#$%^&*|+=[]{}`?-'';
  "editor.multiCursorModifier" = "ctrlCmd";
  "files.autoSave" = "afterDelay";
  "files.autoSaveDelay" = 100;
  "files.insertFinalNewline" = true;
  "files.trimFinalNewlines" = true;
  "files.trimTrailingWhitespace" = true;
  "diffEditor.codeLens" = true;
  "diffEditor.hideUnchangedRegions.enabled" = true;

  # Nix
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "nixd";
  "nix.formatterPath" = "nixpkgs-fmt";
  "nix.serverSettings" = {
    "nixd" = { "formatting" = { "command" = [ "nixpkgs-fmt" ]; }; };
  };

  # JS
  "javascript.validate.enable" = true;
  "javascript.updateImportsOnFileMove.enabled" = "always";
  "typescript.updateImportsOnFileMove.enabled" = "always";
  "javascript.suggest.names" = false;
  "json.maxItemsComputed" = 10000;
  "typescript.inlayHints.functionLikeReturnTypes.enabled" = false;
  "typescript.inlayHints.propertyDeclarationTypes.enabled" = false;
  "typescript.inlayHints.parameterTypes.enabled" = false;
  "typescript.inlayHints.variableTypes.enabled" = false;
  "typescript.inlayHints.enumMemberValues.enabled" = false;
  "typescript.inlayHints.parameterNames.enabled" = "none";
  "typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName" = false;
  "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" =
    false;

  # Formatters
  "[jsonc]"."editor.defaultFormatter" = "vscode.json-language-features";
  "[xml]"."editor.defaultFormatter" = "redhat.vscode-xml";
  "[nginx]"."editor.defaultFormatter" = "raynigon.nginx-formatter";
  "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[dockercompose]"."editor.defaultFormatter" = "ms-azuretools.vscode-docker";
  "[dockerfile]"."editor.defaultFormatter" = "ms-azuretools.vscode-docker";
  "[cpp]"."editor.defaultFormatter" = "ms-vscode.cpptools";
  "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";
  "[python]"."editor.defaultFormatter" = "ms-python.black-formatter";
  "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";
  "[nix]"."editor.defaultFormatter" = "brettm12345.nixfmt-vscode";

  # Plugins
  "eslint.run" = "onSave";
  "cSpell.language" = "en,ru";
  "errorLens.enabledDiagnosticLevels" = [ "warning" "error" ];
  "errorLens.excludeBySource" = [ "cSpell" ];
  "tabnine.experimentalAutoImports" = true;
  "svelte.enable-ts-plugin" = true;
  "svelte.plugin.svelte.format.config.svelteStrictMode" = true;
  "svelte.plugin.svelte.format.config.singleQuote" = true;
  "svelte.plugin.svelte.format.config.printWidth" = 100;
  "vs-code-prettier-eslint.prettierLast" = true;
  "hediet.vscode-drawio.resizeImages" = null;
  "cSpell.userWords" = import ./cspell.nix;
  "prettier.bracketSameLine" = true;
  "prettier.jsxSingleQuote" = true;
  "prettier.trailingComma" = "all";
  "prettier.singleQuote" = true;
  "prettier.arrowParens" = "avoid";
  "prettier.printWidth" = 100;
}
