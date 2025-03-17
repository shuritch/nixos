config: {
  #? Security & Telemetry
  "telemetry.telemetryLevel" = "off";
  "security.workspace.trust.untrustedFiles" = "open";
  "redhat.telemetry.enabled" = false;
  "security.workspace.trust.banner" = "never";
  "security.workspace.trust.startupPrompt" = "never";
  "security.workspace.trust.enabled" = false;

  #? Other
  "extensions.autoUpdate" = true;
  "extensions.ignoreRecommendations" = false;
  "window.customTitleBarVisibility" = "never";
  "window.openFoldersInNewWindow" = "on";
  "window.menuBarVisibility" = "hidden";
  "window.autoDetectColorScheme" = false;
  "window.titleBarStyle" = "native"; # custom | native
  "window.nativeFullScreen" = true;
  "window.restoreWindows" = "all"; # none | all
  "window.newWindowDimensions" = "inherit";
  "window.commandCenter" = false;
  "window.zoomLevel" = 2;
  "window.nativeTabs" = true;

  #? Workbench
  "zenMode.showTabs" = "none";
  "zenMode.centerLayout" = false;
  "git.enabled" = true;
  "git.autofetch" = true;
  "git.confirmSync" = false;
  "git.suggestSmartCommit" = false;
  "git.decorations.enabled" = true;
  "workbench.editor.decorations" = false;
  # "workbench.editor.decorations.badges" = false;
  "breadcrumbs.enabled" = false;
  "scm.diffDecorations" = "none";
  "workbench.tips.enabled" = false;
  "problems.decorations.enabled" = false;
  "workbench.editor.highlightModifiedTabs" = true;
  "workbench.editor.showTabs" = "single"; # none | single
  "workbench.colorTheme" = "Blink Contrast (rainglow)";
  "workbench.iconTheme" = "material-icon-theme";
  "material-icon-theme.files.color" = "#42a5f5";
  "material-icon-theme.activeIconPack" = "angular_ngrx";
  "material-icon-theme.saturation" = 0;
  "workbench.startupEditor" = "none"; # newUntitledFile | readme | none
  "workbench.list.smoothScrolling" = true;
  "workbench.layoutControl.enabled" = false;
  "workbench.editor.enablePreviewFromQuickOpen" = false;
  "workbench.activityBar.location" = "hidden";
  "workbench.statusBar.visible" = false;
  "workbench.editor.editorActionsLocation" = "default";
  "workbench.editor.limit.enabled" = true;
  "workbench.editor.limit.excludeDirty" = true;
  "workbench.editor.limit.value" = 5;
  "workbench.enableExperiments" = false;
  "workbench.statusBar.feedback.visible" = false;
  "workbench.sideBar.location" = "left";
  "workbench.tree.enableStickyScroll" = false;
  "workbench.editor.enablePreview" = false;
  "workbench.tree.indent" = 12;

  #? Terminal
  "workbench.panel.defaultLocation" = "bottom";
  "terminal.integrated.enableMultiLinePasteWarning" = false;
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
  "terminal.integrated.fontLigatures" = true;
  "terminal.integrated.fontFamily" =
    config.my.home.desktop.fonts.monospace.name;

  #? Explorer
  "explorer.fileNesting.patterns" = import ./nest.nix;
  "files.exclude" = import ./exclude.nix;
  "search.exclude" = import ./exclude.nix;
  "search.useIgnoreFiles" = false;
  "explorer.sortOrder" = "type"; # ? type | default
  "explorer.confirmDragAndDrop" = false;
  "explorer.confirmDelete" = false;
  "explorer.compactFolders" = false;
  "explorer.autoReveal" = true;
  "explorer.fileNesting.enabled" = true;
  "explorer.fileNesting.expand" = false;
  "explorer.autoRevealExclude" = {
    "**/node_modules" = true;
    "**/.direnv" = true;
    "**/build" = true;
    "**/dist" = true;
  };

  #? Editor
  "editor.codeLens" = false;
  "editor.suggest.showWords" = false;
  "editor.quickSuggestions.strings" = false;
  "editor.unicodeHighlight.nonBasicASCII" = false;
  "editor.copyWithSyntaxHighlighting" = false;
  "editor.emptySelectionClipboard" = true;
  "editor.snippetSuggestions" = "top";
  "editor.guides.indentation" = false;
  "diffEditor.renderSideBySide" = false;
  "diffEditor.ignoreTrimWhitespace" = false;
  "editor.detectIndentation" = false;
  "editor.formatOnPaste" = false;
  "editor.formatOnType" = false;
  "editor.formatOnSave" = true;
  "editor.defaultFormatter" = "esbenp.prettier-vscode";
  "editor.fontFamily" = config.my.home.desktop.fonts.monospace.name;
  "editor.stickyScroll.enabled" = true;
  "editor.multiCursorModifier" = "ctrlCmd";
  "editor.hideCursorInOverviewRuler" = true;
  "editor.cursorSmoothCaretAnimation" = "on";
  "editor.cursorBlinking" = "expand";
  "editor.cursorStyle" = "line";
  "editor.smoothScrolling" = true;
  "editor.tabSize" = 2;
  "editor.lineNumbers" = "on"; # ? relative | on | off
  "editor.minimap.enabled" = true; # ?
  "editor.minimap.renderCharacters" = false;
  "editor.minimap.scale" = 2;
  "editor.minimap.autohide" = true;
  "editor.wordWrap" = "off";
  "editor.autoIndent" = "full";
  "editor.fontLigatures" = true;
  "editor.fontSize" = 14;
  "editor.lineHeight" = 20;
  "editor.fontWeight" = "400";
  "editor.suggestFontSize" = 14;
  "editor.inlineSuggest.suppressSuggestions" = false;
  "editor.suggestLineHeight" = 20;
  "editor.linkedEditing" = true;
  "editor.mouseWheelZoom" = false;
  "editor.inlineSuggest.enabled" = true;
  "editor.suggest.insertMode" = "insert";
  "editor.minimap.maxColumn" = 80;
  "editor.insertSpaces" = true;
  "editor.largeFileOptimizations" = false;
  "editor.padding.top" = 16;
  "editor.accessibilitySupport" = "off";
  # "editor.letterSpacing" = 0.5;
  "editor.renderWhitespace" = "all";
  "editor.suggestSelection" = "first";
  "editor.tabCompletion" = "on";
  "editor.wordSeparators" = ''/\()"':,.;<>~!@#$%^&*|+=[]{}`?-'';
  "editor.hover.delay" = 800;
  "editor.hover.enabled" = true;
  "editor.matchBrackets" = "never";
  "editor.colorDecorators" = false;
  "editor.lightbulb.enabled" = "off";
  "editor.selectionHighlight" = true;
  "editor.overviewRulerBorder" = false;
  "editor.renderLineHighlight" = "none";
  "editor.occurrencesHighlight" = "off";
  "editor.renderControlCharacters" = false;
  "editor.gotoLocation.multipleReferences" = "goto";
  "editor.gotoLocation.multipleDefinitions" = "goto";
  "editor.gotoLocation.multipleDeclarations" = "goto";
  "editor.gotoLocation.multipleImplementations" = "goto";
  "editor.gotoLocation.multipleTypeDefinitions" = "goto";
  "files.eol" = "\n";
  # "files.autoSave" = "afterDelay"; Bug with new line
  # "files.autoSaveDelay" = 100;
  "files.insertFinalNewline" = true;
  "files.trimFinalNewlines" = true;
  "files.trimTrailingWhitespace" = true;
  "diffEditor.codeLens" = true;
  "diffEditor.hideUnchangedRegions.enabled" = true;
  "diffEditor.wordWrap" = "off";
  "emmet.includeLanguages" = {
    "blade" = "html";
    "vue-html" = "html";
    "vue" = "html";
    "react" = "html";
    "svelte" = "html";
  };

  #? Nix
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "nixd";
  "nix.formatterPath" = "nixpkgs-fmt";
  "nix.serverSettings" = {
    "nixd" = { "formatting" = { "command" = [ "nixpkgs-fmt" ]; }; };
  };

  #? JS
  "javascript.validate.enable" = true;
  "javascript.updateImportsOnFileMove.enabled" = "always";
  "typescript.updateImportsOnFileMove.enabled" = "always";
  "javascript.suggestionActions.enabled" = false;
  "javascript.suggest.names" = false;
  "json.maxItemsComputed" = 10000;
  "typescript.suggestionActions.enabled" = false;
  "typescript.inlayHints.functionLikeReturnTypes.enabled" = false;
  "typescript.inlayHints.propertyDeclarationTypes.enabled" = false;
  "typescript.inlayHints.parameterTypes.enabled" = false;
  "typescript.inlayHints.variableTypes.enabled" = false;
  "typescript.inlayHints.enumMemberValues.enabled" = false;
  "typescript.inlayHints.parameterNames.enabled" = "all"; # ? none
  "typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName" = false;
  "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" =
    false;
  # "[javascript]"."editor.rulers" = [{
  #   "column" = 100;
  #   "color" = "#fd06063f";
  # }];

  #* Formatters
  "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[xml]"."editor.defaultFormatter" = "redhat.vscode-xml";
  "[nginx]"."editor.defaultFormatter" = "raynigon.nginx-formatter";
  "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[dockercompose]"."editor.defaultFormatter" = "ms-azuretools.vscode-docker";
  "[dockerfile]"."editor.defaultFormatter" = "ms-azuretools.vscode-docker";
  "[cpp]"."editor.defaultFormatter" = "ms-vscode.cpptools";
  "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
  "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";
  "[python]"."editor.defaultFormatter" = "ms-python.black-formatter";
  "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";
  "[nix]"."editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
  "[sh]"."editor.defaultFormatter" = "mkhl.shfmt";

  #? Plugins
  "eslint.run" = "onSave";
  "cSpell.language" = "en,ru";
  "errorLens.gutterIconSize" = "auto";
  "errorLens.fontWeight" = "bold";
  "errorLens.fontStyleItalic" = true;
  "errorLens.enabledDiagnosticLevels" = [ "warning" "error" "hint" ];
  "errorLens.excludeBySource" = [ "cSpell" ];
  "errorLens.statusBarIconsEnabled" = true;
  "errorLens.delay" = 500;
  "errorLens.gutterIconsEnabled" = true;
  "errorLens.gutterIconSet" = "emoji";
  "errorLens.gutterEmoji" = {
    "error" = "🦠";
    "warning" = "🧙";
    "info" = "🧼";
    "hint" = "🌀";
  };
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
  "better-comments.tags" = [
    {
      "tag" = "!";
      "color" = "#FF2D00";
      "strikethrough" = false;
      "underline" = false;
      "backgroundColor" = "transparent";
      "bold" = false;
      "italic" = false;
    }
    {
      "tag" = "?";
      "color" = "#3498DB";
      "strikethrough" = false;
      "underline" = false;
      "backgroundColor" = "transparent";
      "bold" = false;
      "italic" = false;
    }
    {
      "tag" = "//";
      "color" = "#474747";
      "strikethrough" = true;
      "underline" = false;
      "backgroundColor" = "transparent";
      "bold" = false;
      "italic" = false;
    }
    {
      "tag" = "todo";
      "color" = "#FF8C00";
      "strikethrough" = false;
      "underline" = false;
      "backgroundColor" = "transparent";
      "bold" = false;
      "italic" = false;
    }
    {
      "tag" = "*";
      "color" = "#98C379";
      "strikethrough" = false;
      "underline" = false;
      "backgroundColor" = "transparent";
      "bold" = false;
      "italic" = false;
    }
  ];
}
