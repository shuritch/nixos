{ linkFarm, pkgs, }:
{ base16colors, ... }:

let
  pname = "theme";
  publisher = "shuritch";
  version = "1.0.0";
  vscodeExtName = "${publisher}.${pname}";
  vscodeExtUniqueId = "${publisher}.${pname}";
  vscodeExtPublisher = "${publisher}";
  theme = {
    "theme/generated.json" = __toJSON {
      name = "${publisher}'s ${pname}";
      type = "dark";
      "$schema" = "vscode://schemas/color-theme";
      colors = {
        "focusBorder" = base16colors.base0E;
        "foreground" = base16colors.base05;
        "disabledForeground" = "#a6adc8";
        "widget.shadow" = "${base16colors.base01}80";
        "selection.background" = "${base16colors.base0E}66";
        "descriptionForeground" = base16colors.base05;
        "errorForeground" = base16colors.base08;
        "icon.foreground" = base16colors.base0E;
        "sash.hoverBorder" = base16colors.base0E;
        "window.activeBorder" = "#00000000";
        "window.inactiveBorder" = "#00000000";
        "textBlockQuote.background" = base16colors.base01;
        "textBlockQuote.border" = base16colors.base01;
        "textCodeBlock.background" = base16colors.base00;
        "textLink.activeForeground" = base16colors.base0C;
        "textLink.foreground" = base16colors.base0D;
        "textPreformat.foreground" = base16colors.base05;
        "textSeparator.foreground" = base16colors.base0E;
        "activityBar.background" = base16colors.base01;
        "activityBar.foreground" = base16colors.base0E;
        "activityBar.dropBorder" = "${base16colors.base0E}33";
        "activityBar.inactiveForeground" = "#6c7086";
        "activityBar.border" = "#00000000";
        "activityBarBadge.background" = base16colors.base0E;
        "activityBarBadge.foreground" = base16colors.base01;
        "activityBar.activeBorder" = "#00000000";
        "activityBar.activeBackground" = "#00000000";
        "activityBar.activeFocusBorder" = "#00000000";
        "activityBarTop.foreground" = base16colors.base0E;
        "activityBarTop.activeBorder" = "#00000000";
        "activityBarTop.inactiveForeground" = "#6c7086";
        "activityBarTop.dropBorder" = "${base16colors.base0E}33";
        "badge.background" = base16colors.base03;
        "badge.foreground" = base16colors.base05;
        "breadcrumb.activeSelectionForeground" = base16colors.base0E;
        "breadcrumb.background" = base16colors.base00;
        "breadcrumb.focusForeground" = base16colors.base0E;
        "breadcrumb.foreground" = "${base16colors.base05}cc";
        "breadcrumbPicker.background" = base16colors.base01;
        "button.background" = base16colors.base0E;
        "button.foreground" = base16colors.base01;
        "button.border" = "#00000000";
        "button.separator" = "#00000000";
        "button.hoverBackground" = base16colors.base0E;
        "button.secondaryForeground" = base16colors.base05;
        "button.secondaryBackground" = base16colors.base04;
        "button.secondaryHoverBackground" = "#686b84";
        "checkbox.background" = base16colors.base03;
        "checkbox.border" = "#00000000";
        "checkbox.foreground" = base16colors.base0E;
        "dropdown.background" = base16colors.base01;
        "dropdown.listBackground" = base16colors.base04;
        "dropdown.border" = base16colors.base0E;
        "dropdown.foreground" = base16colors.base05;
        "debugToolBar.background" = base16colors.base01;
        "debugToolBar.border" = "#00000000";
        "debugExceptionWidget.background" = base16colors.base01;
        "debugExceptionWidget.border" = base16colors.base0E;
        "debugTokenExpression.number" = base16colors.base09;
        "debugTokenExpression.boolean" = base16colors.base0E;
        "debugTokenExpression.string" = base16colors.base0B;
        "debugTokenExpression.error" = base16colors.base08;
        "debugIcon.breakpointForeground" = base16colors.base08;
        "debugIcon.breakpointDisabledForeground" = "${base16colors.base08}99";
        "debugIcon.breakpointUnverifiedForeground" = "#a6738c";
        "debugIcon.breakpointCurrentStackframeForeground" = base16colors.base04;
        "debugIcon.breakpointStackframeForeground" = base16colors.base04;
        "debugIcon.startForeground" = base16colors.base0B;
        "debugIcon.pauseForeground" = base16colors.base0D;
        "debugIcon.stopForeground" = base16colors.base08;
        "debugIcon.disconnectForeground" = base16colors.base04;
        "debugIcon.restartForeground" = base16colors.base0C;
        "debugIcon.stepOverForeground" = base16colors.base0E;
        "debugIcon.stepIntoForeground" = base16colors.base05;
        "debugIcon.stepOutForeground" = base16colors.base05;
        "debugIcon.continueForeground" = base16colors.base0B;
        "debugIcon.stepBackForeground" = base16colors.base04;
        "debugConsole.infoForeground" = base16colors.base0D;
        "debugConsole.warningForeground" = base16colors.base09;
        "debugConsole.errorForeground" = base16colors.base08;
        "debugConsole.sourceForeground" = base16colors.base0F;
        "debugConsoleInputIcon.foreground" = base16colors.base05;
        "diffEditor.border" = base16colors.base04;
        "diffEditor.insertedTextBackground" = "${base16colors.base0B}1a";
        "diffEditor.removedTextBackground" = "${base16colors.base08}1a";
        "diffEditor.insertedLineBackground" = "${base16colors.base0B}26";
        "diffEditor.removedLineBackground" = "${base16colors.base08}26";
        "diffEditor.diagonalFill" = "${base16colors.base04}99";
        "diffEditorOverview.insertedForeground" = "${base16colors.base0B}cc";
        "diffEditorOverview.removedForeground" = "${base16colors.base08}cc";
        "editor.background" = base16colors.base00;
        "editor.findMatchBackground" = "#5e3f53";
        "editor.findMatchBorder" = "${base16colors.base08}33";
        "editor.findMatchHighlightBackground" = "#3e5767";
        "editor.findMatchHighlightBorder" = "${base16colors.base0C}33";
        "editor.findRangeHighlightBackground" = "#3e5767";
        "editor.findRangeHighlightBorder" = "${base16colors.base0C}33";
        "editor.foldBackground" = "${base16colors.base0C}40";
        "editor.foreground" = base16colors.base05;
        "editor.hoverHighlightBackground" = "${base16colors.base0C}40";
        "editor.lineHighlightBackground" = "${base16colors.base05}12";
        "editor.lineHighlightBorder" = "#00000000";
        "editor.rangeHighlightBackground" = "${base16colors.base0C}40";
        "editor.rangeHighlightBorder" = "#00000000";
        "editor.selectionBackground" = "#9399b240";
        "editor.selectionHighlightBackground" = "#9399b233";
        "editor.selectionHighlightBorder" = "#9399b233";
        "editor.wordHighlightBackground" = "#9399b233";
        "editorBracketMatch.background" = "#9399b21a";
        "editorBracketMatch.border" = "#9399b2";
        "editorCodeLens.foreground" = "#7f849c";
        "editorCursor.background" = base16colors.base00;
        "editorCursor.foreground" = base16colors.base0E;
        "editorGroup.border" = base16colors.base04;
        "editorGroup.dropBackground" = "${base16colors.base0E}33";
        "editorGroup.emptyBackground" = base16colors.base00;
        "editorGroupHeader.tabsBackground" = base16colors.base01;
        "editorGutter.addedBackground" = base16colors.base0B;
        "editorGutter.background" = base16colors.base00;
        "editorGutter.commentRangeForeground" = base16colors.base02;
        "editorGutter.commentGlyphForeground" = base16colors.base0E;
        "editorGutter.deletedBackground" = base16colors.base08;
        "editorGutter.foldingControlForeground" = "#9399b2";
        "editorGutter.modifiedBackground" = base16colors.base0A;
        "editorHoverWidget.background" = base16colors.base01;
        "editorHoverWidget.border" = base16colors.base04;
        "editorHoverWidget.foreground" = base16colors.base05;
        "editorIndentGuide.activeBackground" = base16colors.base04;
        "editorIndentGuide.background" = base16colors.base03;
        "editorInlayHint.foreground" = base16colors.base04;
        "editorInlayHint.background" = "${base16colors.base01}bf";
        "editorInlayHint.typeForeground" = "#bac2de";
        "editorInlayHint.typeBackground" = "${base16colors.base01}bf";
        "editorInlayHint.parameterForeground" = "#a6adc8";
        "editorInlayHint.parameterBackground" = "${base16colors.base01}bf";
        "editorLineNumber.activeForeground" = base16colors.base0E;
        "editorLineNumber.foreground" = "#7f849c";
        "editorLink.activeForeground" = base16colors.base0E;
        "editorMarkerNavigation.background" = base16colors.base01;
        "editorMarkerNavigationError.background" = base16colors.base08;
        "editorMarkerNavigationInfo.background" = base16colors.base0D;
        "editorMarkerNavigationWarning.background" = base16colors.base09;
        "editorOverviewRuler.background" = base16colors.base01;
        "editorOverviewRuler.border" = "${base16colors.base05}12";
        "editorOverviewRuler.modifiedForeground" = base16colors.base0A;
        "editorRuler.foreground" = base16colors.base04;
        "editor.stackFrameHighlightBackground" = "${base16colors.base0A}26";
        "editor.focusedStackFrameHighlightBackground" =
          "${base16colors.base0B}26";
        "editorStickyScrollHover.background" = base16colors.base02;
        "editorSuggestWidget.background" = base16colors.base01;
        "editorSuggestWidget.border" = base16colors.base04;
        "editorSuggestWidget.foreground" = base16colors.base05;
        "editorSuggestWidget.highlightForeground" = base16colors.base0E;
        "editorSuggestWidget.selectedBackground" = base16colors.base02;
        "editorWhitespace.foreground" = "#9399b266";
        "editorWidget.background" = base16colors.base01;
        "editorWidget.foreground" = base16colors.base05;
        "editorWidget.resizeBorder" = base16colors.base04;
        "editorLightBulb.foreground" = base16colors.base0A;
        "editorError.foreground" = base16colors.base08;
        "editorError.border" = "#00000000";
        "editorError.background" = "#00000000";
        "editorWarning.foreground" = base16colors.base09;
        "editorWarning.border" = "#00000000";
        "editorWarning.background" = "#00000000";
        "editorInfo.foreground" = base16colors.base0D;
        "editorInfo.border" = "#00000000";
        "editorInfo.background" = "#00000000";
        "problemsErrorIcon.foreground" = base16colors.base08;
        "problemsInfoIcon.foreground" = base16colors.base0D;
        "problemsWarningIcon.foreground" = base16colors.base09;
        "extensionButton.prominentForeground" = base16colors.base01;
        "extensionButton.prominentBackground" = base16colors.base0E;
        "extensionButton.separator" = base16colors.base00;
        "extensionButton.prominentHoverBackground" = base16colors.base0E;
        "extensionBadge.remoteBackground" = base16colors.base0D;
        "extensionBadge.remoteForeground" = base16colors.base01;
        "extensionIcon.starForeground" = base16colors.base0A;
        "extensionIcon.verifiedForeground" = base16colors.base0B;
        "extensionIcon.preReleaseForeground" = base16colors.base04;
        "extensionIcon.sponsorForeground" = base16colors.base0F;
        "gitDecoration.addedResourceForeground" = base16colors.base0B;
        "gitDecoration.conflictingResourceForeground" = base16colors.base0E;
        "gitDecoration.deletedResourceForeground" = base16colors.base08;
        "gitDecoration.ignoredResourceForeground" = "#6c7086";
        "gitDecoration.modifiedResourceForeground" = base16colors.base0A;
        "gitDecoration.stageDeletedResourceForeground" = base16colors.base08;
        "gitDecoration.stageModifiedResourceForeground" = base16colors.base0A;
        "gitDecoration.submoduleResourceForeground" = base16colors.base0D;
        "gitDecoration.untrackedResourceForeground" = base16colors.base0B;
        "input.background" = base16colors.base02;
        "input.border" = "#00000000";
        "input.foreground" = base16colors.base05;
        "input.placeholderForeground" = "${base16colors.base05}73";
        "inputOption.activeBackground" = base16colors.base04;
        "inputOption.activeBorder" = base16colors.base0E;
        "inputOption.activeForeground" = base16colors.base05;
        "inputValidation.errorBackground" = base16colors.base08;
        "inputValidation.errorBorder" = "${base16colors.base01}33";
        "inputValidation.errorForeground" = base16colors.base01;
        "inputValidation.infoBackground" = base16colors.base0D;
        "inputValidation.infoBorder" = "${base16colors.base01}33";
        "inputValidation.infoForeground" = base16colors.base01;
        "inputValidation.warningBackground" = base16colors.base09;
        "inputValidation.warningBorder" = "${base16colors.base01}33";
        "inputValidation.warningForeground" = base16colors.base01;
        "list.activeSelectionBackground" = base16colors.base02;
        "list.activeSelectionForeground" = base16colors.base05;
        "list.dropBackground" = "${base16colors.base0E}33";
        "list.focusBackground" = base16colors.base02;
        "list.focusForeground" = base16colors.base05;
        "list.focusOutline" = "#00000000";
        "list.highlightForeground" = base16colors.base0E;
        "list.hoverBackground" = "${base16colors.base02}80";
        "list.hoverForeground" = base16colors.base05;
        "list.inactiveSelectionBackground" = base16colors.base02;
        "list.inactiveSelectionForeground" = base16colors.base05;
        "list.warningForeground" = base16colors.base09;
        "listFilterWidget.background" = base16colors.base03;
        "listFilterWidget.noMatchesOutline" = base16colors.base08;
        "listFilterWidget.outline" = "#00000000";
        "tree.indentGuidesStroke" = "#9399b2";
        "tree.inactiveIndentGuidesStroke" = base16colors.base03;
        "menu.background" = base16colors.base00;
        "menu.border" = "${base16colors.base00}80";
        "menu.foreground" = base16colors.base05;
        "menu.selectionBackground" = base16colors.base04;
        "menu.selectionBorder" = "#00000000";
        "menu.selectionForeground" = base16colors.base05;
        "menu.separatorBackground" = base16colors.base04;
        "menubar.selectionBackground" = base16colors.base03;
        "menubar.selectionForeground" = base16colors.base05;
        "merge.commonContentBackground" = base16colors.base03;
        "merge.commonHeaderBackground" = base16colors.base04;
        "merge.currentContentBackground" = "${base16colors.base0B}33";
        "merge.currentHeaderBackground" = "${base16colors.base0B}66";
        "merge.incomingContentBackground" = "${base16colors.base0D}33";
        "merge.incomingHeaderBackground" = "${base16colors.base0D}66";
        "minimap.background" = "${base16colors.base01}80";
        "minimap.findMatchHighlight" = "${base16colors.base0C}4d";
        "minimap.selectionHighlight" = "${base16colors.base04}bf";
        "minimap.selectionOccurrenceHighlight" = "${base16colors.base04}bf";
        "minimap.warningHighlight" = "${base16colors.base09}bf";
        "minimap.errorHighlight" = "${base16colors.base08}bf";
        "minimapSlider.background" = "${base16colors.base0E}33";
        "minimapSlider.hoverBackground" = "${base16colors.base0E}66";
        "minimapSlider.activeBackground" = "${base16colors.base0E}99";
        "minimapGutter.addedBackground" = "${base16colors.base0B}bf";
        "minimapGutter.deletedBackground" = "${base16colors.base08}bf";
        "minimapGutter.modifiedBackground" = "${base16colors.base0A}bf";
        "notificationCenter.border" = base16colors.base0E;
        "notificationCenterHeader.foreground" = base16colors.base05;
        "notificationCenterHeader.background" = base16colors.base01;
        "notificationToast.border" = base16colors.base0E;
        "notifications.foreground" = base16colors.base05;
        "notifications.background" = base16colors.base01;
        "notifications.border" = base16colors.base0E;
        "notificationLink.foreground" = base16colors.base0D;
        "notificationsErrorIcon.foreground" = base16colors.base08;
        "notificationsWarningIcon.foreground" = base16colors.base09;
        "notificationsInfoIcon.foreground" = base16colors.base0D;
        "panel.background" = base16colors.base00;
        "panel.border" = base16colors.base04;
        "panelSection.border" = base16colors.base04;
        "panelSection.dropBackground" = "${base16colors.base0E}33";
        "panelTitle.activeBorder" = base16colors.base0E;
        "panelTitle.activeForeground" = base16colors.base05;
        "panelTitle.inactiveForeground" = "#a6adc8";
        "peekView.border" = base16colors.base0E;
        "peekViewEditor.background" = base16colors.base01;
        "peekViewEditorGutter.background" = base16colors.base01;
        "peekViewEditor.matchHighlightBackground" = "${base16colors.base0C}4d";
        "peekViewEditor.matchHighlightBorder" = "#00000000";
        "peekViewResult.background" = base16colors.base01;
        "peekViewResult.fileForeground" = base16colors.base05;
        "peekViewResult.lineForeground" = base16colors.base05;
        "peekViewResult.matchHighlightBackground" = "${base16colors.base0C}4d";
        "peekViewResult.selectionBackground" = base16colors.base02;
        "peekViewResult.selectionForeground" = base16colors.base05;
        "peekViewTitle.background" = base16colors.base00;
        "peekViewTitleDescription.foreground" = "#bac2deb3";
        "peekViewTitleLabel.foreground" = base16colors.base05;
        "pickerGroup.border" = base16colors.base0E;
        "pickerGroup.foreground" = base16colors.base0E;
        "progressBar.background" = base16colors.base0E;
        "scrollbar.shadow" = base16colors.base01;
        "scrollbarSlider.activeBackground" = "${base16colors.base02}66";
        "scrollbarSlider.background" = "${base16colors.base04}80";
        "scrollbarSlider.hoverBackground" = "#6c7086";
        "settings.focusedRowBackground" = "${base16colors.base04}33";
        "settings.headerForeground" = base16colors.base05;
        "settings.modifiedItemIndicator" = base16colors.base0E;
        "settings.dropdownBackground" = base16colors.base03;
        "settings.dropdownListBorder" = "#00000000";
        "settings.textInputBackground" = base16colors.base03;
        "settings.textInputBorder" = "#00000000";
        "settings.numberInputBackground" = base16colors.base03;
        "settings.numberInputBorder" = "#00000000";
        "sideBar.background" = base16colors.base01;
        "sideBar.dropBackground" = "${base16colors.base0E}33";
        "sideBar.foreground" = base16colors.base05;
        "sideBar.border" = "#00000000";
        "sideBarSectionHeader.background" = base16colors.base01;
        "sideBarSectionHeader.foreground" = base16colors.base05;
        "sideBarTitle.foreground" = base16colors.base0E;
        "banner.background" = base16colors.base03;
        "banner.foreground" = base16colors.base05;
        "banner.iconForeground" = base16colors.base05;
        "statusBar.background" = base16colors.base01;
        "statusBar.foreground" = base16colors.base05;
        "statusBar.border" = "#00000000";
        "statusBar.noFolderBackground" = base16colors.base01;
        "statusBar.noFolderForeground" = base16colors.base05;
        "statusBar.noFolderBorder" = "#00000000";
        "statusBar.debuggingBackground" = base16colors.base09;
        "statusBar.debuggingForeground" = base16colors.base01;
        "statusBar.debuggingBorder" = "#00000000";
        "statusBarItem.remoteBackground" = base16colors.base0D;
        "statusBarItem.remoteForeground" = base16colors.base01;
        "statusBarItem.activeBackground" = "${base16colors.base04}66";
        "statusBarItem.hoverBackground" = "${base16colors.base04}33";
        "statusBarItem.prominentForeground" = base16colors.base0E;
        "statusBarItem.prominentBackground" = "#00000000";
        "statusBarItem.prominentHoverBackground" = "${base16colors.base04}33";
        "statusBarItem.errorForeground" = base16colors.base08;
        "statusBarItem.errorBackground" = "#00000000";
        "statusBarItem.warningForeground" = base16colors.base09;
        "statusBarItem.warningBackground" = "#00000000";
        "commandCenter.foreground" = "#bac2de";
        "commandCenter.inactiveForeground" = "#bac2de";
        "commandCenter.activeForeground" = base16colors.base0E;
        "commandCenter.background" = base16colors.base01;
        "commandCenter.activeBackground" = "${base16colors.base04}33";
        "commandCenter.border" = "#00000000";
        "commandCenter.inactiveBorder" = "#00000000";
        "commandCenter.activeBorder" = base16colors.base0E;
        "tab.activeBackground" = base16colors.base00;
        "tab.activeBorder" = "#00000000";
        "tab.activeBorderTop" = base16colors.base0E;
        "tab.activeForeground" = base16colors.base0E;
        "tab.activeModifiedBorder" = base16colors.base0A;
        "tab.border" = base16colors.base01;
        "tab.hoverBackground" = "#28283d";
        "tab.hoverBorder" = "#00000000";
        "tab.hoverForeground" = base16colors.base0E;
        "tab.inactiveBackground" = base16colors.base01;
        "tab.inactiveForeground" = "#6c7086";
        "tab.inactiveModifiedBorder" = "${base16colors.base0A}4d";
        "tab.lastPinnedBorder" = base16colors.base0E;
        "tab.unfocusedActiveBackground" = base16colors.base01;
        "tab.unfocusedActiveBorder" = "#00000000";
        "tab.unfocusedActiveBorderTop" = "${base16colors.base0E}4d";
        "tab.unfocusedInactiveBackground" = "#0e0e16";
        "terminal.foreground" = base16colors.base05;
        "terminal.ansiBlack" = "#a6adc8";
        "terminal.ansiRed" = base16colors.base08;
        "terminal.ansiGreen" = base16colors.base0B;
        "terminal.ansiYellow" = base16colors.base0A;
        "terminal.ansiBlue" = base16colors.base0D;
        "terminal.ansiMagenta" = base16colors.base0F;
        "terminal.ansiCyan" = base16colors.base0C;
        "terminal.ansiWhite" = "#bac2de";
        "terminal.ansiBrightBlack" = base16colors.base04;
        "terminal.ansiBrightRed" = base16colors.base08;
        "terminal.ansiBrightGreen" = base16colors.base0B;
        "terminal.ansiBrightYellow" = base16colors.base0A;
        "terminal.ansiBrightBlue" = base16colors.base0D;
        "terminal.ansiBrightMagenta" = base16colors.base0F;
        "terminal.ansiBrightCyan" = base16colors.base0C;
        "terminal.ansiBrightWhite" = base16colors.base03;
        "terminal.selectionBackground" = base16colors.base04;
        "terminal.inactiveSelectionBackground" = "${base16colors.base04}80";
        "terminalCursor.background" = base16colors.base00;
        "terminalCursor.foreground" = base16colors.base0E;
        "terminal.border" = base16colors.base04;
        "terminal.dropBackground" = "${base16colors.base0E}33";
        "terminal.tab.activeBorder" = base16colors.base0E;
        "terminalCommandDecoration.defaultBackground" = base16colors.base04;
        "terminalCommandDecoration.successBackground" = base16colors.base0B;
        "terminalCommandDecoration.errorBackground" = base16colors.base08;
        "titleBar.activeBackground" = base16colors.base01;
        "titleBar.activeForeground" = base16colors.base05;
        "titleBar.inactiveBackground" = base16colors.base01;
        "titleBar.inactiveForeground" = "${base16colors.base05}80";
        "titleBar.border" = "#00000000";
        "welcomePage.tileBackground" = base16colors.base01;
        "welcomePage.progress.background" = base16colors.base01;
        "welcomePage.progress.foreground" = base16colors.base0E;
        "walkThrough.embeddedEditorBackground" = "${base16colors.base00}4d";
        "symbolIcon.textForeground" = base16colors.base05;
        "symbolIcon.arrayForeground" = base16colors.base09;
        "symbolIcon.booleanForeground" = base16colors.base0E;
        "symbolIcon.classForeground" = base16colors.base0A;
        "symbolIcon.colorForeground" = base16colors.base0F;
        "symbolIcon.constantForeground" = base16colors.base09;
        "symbolIcon.constructorForeground" = base16colors.base07;
        "symbolIcon.enumeratorForeground" = base16colors.base0A;
        "symbolIcon.enumeratorMemberForeground" = base16colors.base0A;
        "symbolIcon.eventForeground" = base16colors.base0F;
        "symbolIcon.fieldForeground" = base16colors.base05;
        "symbolIcon.fileForeground" = base16colors.base0E;
        "symbolIcon.folderForeground" = base16colors.base0E;
        "symbolIcon.functionForeground" = base16colors.base0D;
        "symbolIcon.interfaceForeground" = base16colors.base0A;
        "symbolIcon.keyForeground" = base16colors.base0C;
        "symbolIcon.keywordForeground" = base16colors.base0E;
        "symbolIcon.methodForeground" = base16colors.base0D;
        "symbolIcon.moduleForeground" = base16colors.base05;
        "symbolIcon.namespaceForeground" = base16colors.base0A;
        "symbolIcon.nullForeground" = base16colors.base08;
        "symbolIcon.numberForeground" = base16colors.base09;
        "symbolIcon.objectForeground" = base16colors.base0A;
        "symbolIcon.operatorForeground" = base16colors.base0C;
        "symbolIcon.packageForeground" = base16colors.base06;
        "symbolIcon.propertyForeground" = base16colors.base08;
        "symbolIcon.referenceForeground" = base16colors.base0A;
        "symbolIcon.snippetForeground" = base16colors.base06;
        "symbolIcon.stringForeground" = base16colors.base0B;
        "symbolIcon.structForeground" = base16colors.base0C;
        "symbolIcon.typeParameterForeground" = base16colors.base08;
        "symbolIcon.unitForeground" = base16colors.base05;
        "symbolIcon.variableForeground" = base16colors.base05;
        "charts.foreground" = base16colors.base05;
        "charts.lines" = "#bac2de";
        "charts.red" = base16colors.base08;
        "charts.blue" = base16colors.base0D;
        "charts.yellow" = base16colors.base0A;
        "charts.orange" = base16colors.base09;
        "charts.green" = base16colors.base0B;
        "charts.purple" = base16colors.base0E;
        "errorLens.errorBackground" = "${base16colors.base08}26";
        "errorLens.errorBackgroundLight" = "${base16colors.base08}26";
        "errorLens.errorForeground" = base16colors.base08;
        "errorLens.errorForegroundLight" = base16colors.base08;
        "errorLens.errorMessageBackground" = "${base16colors.base08}26";
        "errorLens.hintBackground" = "${base16colors.base0B}26";
        "errorLens.hintBackgroundLight" = "${base16colors.base0B}26";
        "errorLens.hintForeground" = base16colors.base0B;
        "errorLens.hintForegroundLight" = base16colors.base0B;
        "errorLens.hintMessageBackground" = "${base16colors.base0B}26";
        "errorLens.infoBackground" = "${base16colors.base0D}26";
        "errorLens.infoBackgroundLight" = "${base16colors.base0D}26";
        "errorLens.infoForeground" = base16colors.base0D;
        "errorLens.infoForegroundLight" = base16colors.base0D;
        "errorLens.infoMessageBackground" = "${base16colors.base0D}26";
        "errorLens.statusBarErrorForeground" = base16colors.base08;
        "errorLens.statusBarHintForeground" = base16colors.base0B;
        "errorLens.statusBarIconErrorForeground" = base16colors.base08;
        "errorLens.statusBarIconWarningForeground" = base16colors.base09;
        "errorLens.statusBarInfoForeground" = base16colors.base0D;
        "errorLens.statusBarWarningForeground" = base16colors.base09;
        "errorLens.warningBackground" = "${base16colors.base09}26";
        "errorLens.warningBackgroundLight" = "${base16colors.base09}26";
        "errorLens.warningForeground" = base16colors.base09;
        "errorLens.warningForegroundLight" = base16colors.base09;
        "errorLens.warningMessageBackground" = "${base16colors.base09}26";
        "issues.closed" = base16colors.base0E;
        "issues.newIssueDecoration" = base16colors.base0F;
        "issues.open" = base16colors.base0B;
        "pullRequests.closed" = base16colors.base08;
        "pullRequests.draft" = "#9399b2";
        "pullRequests.merged" = base16colors.base0E;
        "pullRequests.notification" = base16colors.base05;
        "pullRequests.open" = base16colors.base0B;
        "gitlens.gutterBackgroundColor" = "${base16colors.base02}4d";
        "gitlens.gutterForegroundColor" = base16colors.base05;
        "gitlens.gutterUncommittedForegroundColor" = base16colors.base0E;
        "gitlens.trailingLineBackgroundColor" = "#00000000";
        "gitlens.trailingLineForegroundColor" = "${base16colors.base05}4d";
        "gitlens.lineHighlightBackgroundColor" = "${base16colors.base0E}26";
        "gitlens.lineHighlightOverviewRulerColor" = "${base16colors.base0E}cc";
        "gitlens.openAutolinkedIssueIconColor" = base16colors.base0B;
        "gitlens.closedAutolinkedIssueIconColor" = base16colors.base0E;
        "gitlens.closedPullRequestIconColor" = base16colors.base08;
        "gitlens.openPullRequestIconColor" = base16colors.base0B;
        "gitlens.mergedPullRequestIconColor" = base16colors.base0E;
        "gitlens.unpublishedChangesIconColor" = base16colors.base0B;
        "gitlens.unpublishedCommitIconColor" = base16colors.base0B;
        "gitlens.unpulledChangesIconColor" = base16colors.base09;
        "gitlens.decorations.branchAheadForegroundColor" = base16colors.base0B;
        "gitlens.decorations.branchBehindForegroundColor" = base16colors.base09;
        "gitlens.decorations.branchDivergedForegroundColor" =
          base16colors.base0A;
        "gitlens.decorations.branchUnpublishedForegroundColor" =
          base16colors.base0B;
        "gitlens.decorations.branchMissingUpstreamForegroundColor" =
          base16colors.base09;
        "gitlens.decorations.statusMergingOrRebasingConflictForegroundColor" =
          base16colors.base08;
        "gitlens.decorations.statusMergingOrRebasingForegroundColor" =
          base16colors.base0A;
        "gitlens.decorations.workspaceRepoMissingForegroundColor" = "#a6adc8";
        "gitlens.decorations.workspaceCurrentForegroundColor" =
          base16colors.base0E;
        "gitlens.decorations.workspaceRepoOpenForegroundColor" =
          base16colors.base0E;
        "gitlens.decorations.worktreeHasUncommittedChangesForegroundColor" =
          base16colors.base09;
        "gitlens.decorations.worktreeMissingForegroundColor" =
          base16colors.base08;
        "gitlens.graphLane1Color" = base16colors.base0E;
        "gitlens.graphLane2Color" = base16colors.base0A;
        "gitlens.graphLane3Color" = base16colors.base0D;
        "gitlens.graphLane4Color" = base16colors.base06;
        "gitlens.graphLane5Color" = base16colors.base0B;
        "gitlens.graphLane6Color" = base16colors.base07;
        "gitlens.graphLane7Color" = base16colors.base0F;
        "gitlens.graphLane8Color" = base16colors.base08;
        "gitlens.graphLane9Color" = base16colors.base0C;
        "gitlens.graphLane10Color" = base16colors.base0F;
        "gitlens.graphChangesColumnAddedColor" = base16colors.base0B;
        "gitlens.graphChangesColumnDeletedColor" = base16colors.base08;
        "gitlens.graphMinimapMarkerHeadColor" = base16colors.base0B;
        "gitlens.graphScrollMarkerHeadColor" = base16colors.base0B;
        "gitlens.graphMinimapMarkerUpstreamColor" = base16colors.base0B;
        "gitlens.graphScrollMarkerUpstreamColor" = base16colors.base0B;
        "gitlens.graphMinimapMarkerHighlightsColor" = base16colors.base0A;
        "gitlens.graphScrollMarkerHighlightsColor" = base16colors.base0A;
        "gitlens.graphMinimapMarkerLocalBranchesColor" = base16colors.base0D;
        "gitlens.graphScrollMarkerLocalBranchesColor" = base16colors.base0D;
        "gitlens.graphMinimapMarkerRemoteBranchesColor" = base16colors.base0D;
        "gitlens.graphScrollMarkerRemoteBranchesColor" = base16colors.base0D;
        "gitlens.graphMinimapMarkerStashesColor" = base16colors.base0E;
        "gitlens.graphScrollMarkerStashesColor" = base16colors.base0E;
        "gitlens.graphMinimapMarkerTagsColor" = base16colors.base06;
        "gitlens.graphScrollMarkerTagsColor" = base16colors.base06;
        "editorBracketHighlight.foreground1" = base16colors.base08;
        "editorBracketHighlight.foreground2" = base16colors.base09;
        "editorBracketHighlight.foreground3" = base16colors.base0A;
        "editorBracketHighlight.foreground4" = base16colors.base0B;
        "editorBracketHighlight.foreground5" = base16colors.base0D;
        "editorBracketHighlight.foreground6" = base16colors.base0E;
        "editorBracketHighlight.unexpectedBracket.foreground" =
          base16colors.base08;
        "button.secondaryBorder" = base16colors.base0E;
        "table.headerBackground" = base16colors.base02;
        "table.headerForeground" = base16colors.base05;
        "list.focusAndSelectionBackground" = base16colors.base03;
      };
      "semanticHighlighting" = true;

      "semanticTokenColors" = {
        "enumMember" = { "foreground" = base16colors.base0C; };
        "selfKeyword" = { "foreground" = base16colors.base08; };
        "boolean" = { "foreground" = base16colors.base09; };
        "number" = { "foreground" = base16colors.base09; };
        "variable.defaultLibrary" = { "foreground" = base16colors.base08; };
        "class:python" = { "foreground" = base16colors.base0A; };
        "class.builtin:python" = { "foreground" = base16colors.base0E; };
        "variable.typeHint:python" = { "foreground" = base16colors.base0A; };
        "function.decorator:python" = { "foreground" = base16colors.base09; };
        "variable.readonly:javascript" = {
          "foreground" = base16colors.base05;
        };
        "variable.readonly:typescript" = {
          "foreground" = base16colors.base05;
        };
        "property.readonly:javascript" = {
          "foreground" = base16colors.base05;
        };
        "property.readonly:typescript" = {
          "foreground" = base16colors.base05;
        };
        "variable.readonly:javascriptreact" = {
          "foreground" = base16colors.base05;
        };
        "variable.readonly:typescriptreact" = {
          "foreground" = base16colors.base05;
        };
        "property.readonly:javascriptreact" = {
          "foreground" = base16colors.base05;
        };
        "property.readonly:typescriptreact" = {
          "foreground" = base16colors.base05;
        };
        "variable.readonly:scala" = { "foreground" = base16colors.base05; };
        "type.defaultLibrary:go" = { "foreground" = base16colors.base0E; };
        "variable.readonly.defaultLibrary:go" = {
          "foreground" = base16colors.base0E;
        };
        "tomlArrayKey" = {
          "foreground" = base16colors.base0D;
          "fontStyle" = "";
        };
        "tomlTableKey" = {
          "foreground" = base16colors.base0D;
          "fontStyle" = "";
        };
        "builtinAttribute.attribute.library:rust" = {
          "foreground" = base16colors.base0D;
        };
        "generic.attribute:rust" = { "foreground" = base16colors.base05; };
        "constant.builtin.readonly:nix" = {
          "foreground" = base16colors.base0E;
        };
        "heading" = { "foreground" = base16colors.base08; };
        "text.emph" = {
          "foreground" = base16colors.base08;
          "fontStyle" = "italic";
        };
        "text.strong" = {
          "foreground" = base16colors.base08;
          "fontStyle" = "bold";
        };
        "text.math" = { "foreground" = base16colors.base06; };
        "pol" = { "foreground" = base16colors.base06; };
      };
      "tokenColors" = [
        {
          "name" = "Basic text & variable names (incl. leading punctuation)";
          "scope" = [
            "text"
            "source"
            "variable.other.readwrite"
            "punctuation.definition.variable"
          ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Parentheses, Brackets, Braces";
          "scope" = "punctuation";
          "settings" = {
            "foreground" = "#9399b2";
            "fontStyle" = "";
          };
        }
        {
          "name" = "Comments";
          "scope" = [ "comment" "punctuation.definition.comment" ];
          "settings" = {
            "foreground" = "#6c7086";
            "fontStyle" = "italic";
          };
        }
        {
          "scope" = [ "string" "punctuation.definition.string" ];
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "scope" = "constant.character.escape";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Booleans, constants, numbers";
          "scope" = [
            "constant.numeric"
            "variable.other.constant"
            "entity.name.constant"
            "constant.language.boolean"
            "constant.language.false"
            "constant.language.true"
            "keyword.other.unit.user-defined"
            "keyword.other.unit.suffix.floating-point"
          ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "scope" = [
            "keyword"
            "keyword.operator.word"
            "keyword.operator.new"
            "variable.language.super"
            "support.type.primitive"
            "storage.type"
            "storage.modifier"
            "punctuation.definition.keyword"
          ];
          "settings" = {
            "foreground" = base16colors.base0E;
            "fontStyle" = "";
          };
        }
        {
          "scope" = "entity.name.tag.documentation";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Punctuation";
          "scope" = [
            "keyword.operator"
            "punctuation.accessor"
            "punctuation.definition.generic"
            "meta.function.closure punctuation.section.parameters"
            "punctuation.definition.tag"
            "punctuation.separator.key-value"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "scope" = [
            "entity.name.function"
            "meta.function-call.method"
            "support.function"
            "support.function.misc"
            "variable.function"
          ];
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Classes";
          "scope" = [
            "entity.name.class"
            "entity.other.inherited-class"
            "support.class"
            "meta.function-call.constructor"
            "entity.name.struct"
          ];
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Enum";
          "scope" = "entity.name.enum";
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Enum member";
          "scope" = [
            "meta.enum variable.other.readwrite"
            "variable.other.enummember"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Object properties";
          "scope" = "meta.property.object";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Types";
          "scope" =
            [ "meta.type" "meta.type-alias" "support.type" "entity.name.type" ];
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Decorators";
          "scope" = [
            "meta.annotation variable.function"
            "meta.annotation variable.annotation.function"
            "meta.annotation punctuation.definition.annotation"
            "meta.decorator"
            "punctuation.decorator"
          ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "scope" = [ "variable.parameter" "meta.function.parameters" ];
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Built-ins";
          "scope" = [ "constant.language" "support.function.builtin" ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "scope" = "entity.other.attribute-name.documentation";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "Preprocessor directives";
          "scope" =
            [ "keyword.control.directive" "punctuation.definition.directive" ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Type parameters";
          "scope" = "punctuation.definition.typeparameters";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Namespaces";
          "scope" = "entity.name.namespace";
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Property names (left hand assignments in json/yaml/css)";
          "scope" = "support.type.property-name.css";
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "";
          };
        }
        {
          "name" = "This/Self keyword";
          "scope" = [
            "variable.language.this"
            "variable.language.this punctuation.definition.variable"
          ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "Object properties";
          "scope" = "variable.object.property";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "String template interpolation";
          "scope" = [ "string.template variable" "string variable" ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "`new` as bold";
          "scope" = "keyword.operator.new";
          "settings" = { "fontStyle" = "bold"; };
        }
        {
          "name" = "C++ extern keyword";
          "scope" = "storage.modifier.specifier.extern.cpp";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "C++ scope resolution";
          "scope" = [
            "entity.name.scope-resolution.template.call.cpp"
            "entity.name.scope-resolution.parameter.cpp"
            "entity.name.scope-resolution.cpp"
            "entity.name.scope-resolution.function.definition.cpp"
          ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "C++ doc keywords";
          "scope" = "storage.type.class.doxygen";
          "settings" = { "fontStyle" = ""; };
        }
        {
          "name" = "C++ operators";
          "scope" = [ "storage.modifier.reference.cpp" ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "C# Interpolated Strings";
          "scope" = "meta.interpolation.cs";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "C# xml-style docs";
          "scope" = "comment.block.documentation.cs";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Classes, reflecting the className color in JSX";
          "scope" = [
            "source.css entity.other.attribute-name.class.css"
            "entity.other.attribute-name.parent-selector.css punctuation.definition.entity.css"
          ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Operators";
          "scope" = "punctuation.separator.operator.css";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Pseudo classes";
          "scope" = "source.css entity.other.attribute-name.pseudo-class";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "scope" = "source.css constant.other.unicode-range";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "scope" = "source.css variable.parameter.url";
          "settings" = {
            "foreground" = base16colors.base0B;
            "fontStyle" = "";
          };
        }
        {
          "name" = "CSS vendored property names";
          "scope" = [ "support.type.vendored.property-name" ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Less/SCSS right-hand variables (@/$-prefixed)";
          "scope" = [
            "source.css meta.property-value variable"
            "source.css meta.property-value variable.other.less"
            "source.css meta.property-value variable.other.less punctuation.definition.variable.less"
            "meta.definition.variable.scss"
          ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "CSS variables (--prefixed)";
          "scope" = [
            "source.css meta.property-list variable"
            "meta.property-list variable.other.less"
            "meta.property-list variable.other.less punctuation.definition.variable.less"
          ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "CSS Percentage values, styled the same as numbers";
          "scope" = "keyword.other.unit.percentage.css";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "CSS Attribute selectors, styled the same as strings";
          "scope" = "source.css meta.attribute-selector";
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "name" = "JSON/YAML keys, other left-hand assignments";
          "scope" = [
            "keyword.other.definition.ini"
            "punctuation.support.type.property-name.json"
            "support.type.property-name.json"
            "punctuation.support.type.property-name.toml"
            "support.type.property-name.toml"
            "entity.name.tag.yaml"
            "punctuation.support.type.property-name.yaml"
            "support.type.property-name.yaml"
          ];
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "";
          };
        }
        {
          "name" = "JSON/YAML constants";
          "scope" = [ "constant.language.json" "constant.language.yaml" ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "YAML anchors";
          "scope" =
            [ "entity.name.type.anchor.yaml" "variable.other.alias.yaml" ];
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "";
          };
        }
        {
          "name" = "TOML tables / ini groups";
          "scope" = [
            "support.type.property-name.table"
            "entity.name.section.group-title.ini"
          ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "TOML dates";
          "scope" = "constant.other.time.datetime.offset.toml";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "YAML anchor puctuation";
          "scope" = [
            "punctuation.definition.anchor.yaml"
            "punctuation.definition.alias.yaml"
          ];
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "YAML triple dashes";
          "scope" = "entity.other.document.begin.yaml";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Markup Diff";
          "scope" = "markup.changed.diff";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Diff";
          "scope" = [
            "meta.diff.header.from-file"
            "meta.diff.header.to-file"
            "punctuation.definition.from-file.diff"
            "punctuation.definition.to-file.diff"
          ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "Diff Inserted";
          "scope" = "markup.inserted.diff";
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "name" = "Diff Deleted";
          "scope" = "markup.deleted.diff";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "dotenv left-hand side assignments";
          "scope" = [ "variable.other.env" ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "dotenv reference to existing env variable";
          "scope" = [ "string.quoted variable.other.env" ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "GDScript functions";
          "scope" = "support.function.builtin.gdscript";
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "GDScript constants";
          "scope" = "constant.language.gdscript";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Comment keywords";
          "scope" = "comment meta.annotation.go";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "go:embed, go:build, etc.";
          "scope" = "comment meta.annotation.parameters.go";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Go constants (nil, true, false)";
          "scope" = "constant.language.go";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "GraphQL variables";
          "scope" = "variable.graphql";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "GraphQL aliases";
          "scope" = "string.unquoted.alias.graphql";
          "settings" = { "foreground" = base16colors.base06; };
        }
        {
          "name" = "GraphQL enum members";
          "scope" = "constant.character.enum.graphql";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "GraphQL field in types";
          "scope" =
            "meta.objectvalues.graphql constant.object.key.graphql string.unquoted.graphql";
          "settings" = { "foreground" = base16colors.base06; };
        }
        {
          "name" = "HTML/XML DOCTYPE as keyword";
          "scope" = [
            "keyword.other.doctype"
            "meta.tag.sgml.doctype punctuation.definition.tag"
            "meta.tag.metadata.doctype entity.name.tag"
            "meta.tag.metadata.doctype punctuation.definition.tag"
          ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "HTML/XML-like <tags/>";
          "scope" = [ "entity.name.tag" ];
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Special characters like &amp;";
          "scope" = [
            "text.html constant.character.entity"
            "text.html constant.character.entity punctuation"
            "constant.character.entity.xml"
            "constant.character.entity.xml punctuation"
            "constant.character.entity.js.jsx"
            "constant.charactger.entity.js.jsx punctuation"
            "constant.character.entity.tsx"
            "constant.character.entity.tsx punctuation"
          ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "HTML/XML tag attribute values";
          "scope" = [ "entity.other.attribute-name" ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Components";
          "scope" = [
            "support.class.component"
            "support.class.component.jsx"
            "support.class.component.tsx"
            "support.class.component.vue"
          ];
          "settings" = {
            "foreground" = base16colors.base0F;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Annotations";
          "scope" =
            [ "punctuation.definition.annotation" "storage.type.annotation" ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Java enums";
          "scope" = "constant.other.enum.java";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Java imports";
          "scope" = "storage.modifier.import.java";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Javadoc";
          "scope" =
            "comment.block.javadoc.java keyword.other.documentation.javadoc.java";
          "settings" = { "fontStyle" = ""; };
        }
        {
          "name" = "Exported Variable";
          "scope" = "meta.export variable.other.readwrite.js";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "JS/TS constants & properties";
          "scope" = [
            "variable.other.constant.js"
            "variable.other.constant.ts"
            "variable.other.property.js"
            "variable.other.property.ts"
          ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "JSDoc; these are mainly params, so styled as such";
          "scope" = [
            "variable.other.jsdoc"
            "comment.block.documentation variable.other"
          ];
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "";
          };
        }
        {
          "name" = "JSDoc keywords";
          "scope" = "storage.type.class.jsdoc";
          "settings" = { "fontStyle" = ""; };
        }
        {
          "scope" = "support.type.object.console.js";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Node constants as keywords (module, etc.)";
          "scope" = [ "support.constant.node" "support.type.object.module.js" ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "implements as keyword";
          "scope" = "storage.modifier.implements";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Builtin types";
          "scope" = [
            "constant.language.null.js"
            "constant.language.null.ts"
            "constant.language.undefined.js"
            "constant.language.undefined.ts"
            "support.type.builtin.ts"
          ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "scope" = "variable.parameter.generic";
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Arrow functions";
          "scope" = [
            "keyword.declaration.function.arrow.js"
            "storage.type.function.arrow.ts"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" =
            "Decorator punctuations (decorators inherit from blue functions, instead of styleguide peach)";
          "scope" = "punctuation.decorator.ts";
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Extra JS/TS keywords";
          "scope" = [
            "keyword.operator.expression.in.js"
            "keyword.operator.expression.in.ts"
            "keyword.operator.expression.infer.ts"
            "keyword.operator.expression.instanceof.js"
            "keyword.operator.expression.instanceof.ts"
            "keyword.operator.expression.is"
            "keyword.operator.expression.keyof.ts"
            "keyword.operator.expression.of.js"
            "keyword.operator.expression.of.ts"
            "keyword.operator.expression.typeof.ts"
          ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Julia macros";
          "scope" = "support.function.macro.julia";
          "settings" = {
            "foreground" = base16colors.base0C;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Julia language constants (true, false)";
          "scope" = "constant.language.julia";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" =
            "Julia other constants (these seem to be arguments inside arrays)";
          "scope" = "constant.other.symbol.julia";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "LaTeX preamble";
          "scope" = "text.tex keyword.control.preamble";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "LaTeX be functions";
          "scope" = "text.tex support.function.be";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "LaTeX math";
          "scope" = "constant.other.general.math.tex";
          "settings" = { "foreground" = base16colors.base06; };
        }
        {
          "name" = "Lua docstring keywords";
          "scope" =
            "comment.line.double-dash.documentation.lua storage.type.annotation.lua";
          "settings" = {
            "foreground" = base16colors.base0E;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Lua docstring variables";
          "scope" = [
            "comment.line.double-dash.documentation.lua entity.name.variable.lua"
            "comment.line.double-dash.documentation.lua variable.lua"
          ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "scope" = [
            "heading.1.markdown punctuation.definition.heading.markdown"
            "heading.1.markdown"
            "heading.1.quarto punctuation.definition.heading.quarto"
            "heading.1.quarto"
            "markup.heading.atx.1.mdx"
            "markup.heading.atx.1.mdx punctuation.definition.heading.mdx"
            "markup.heading.setext.1.markdown"
            "markup.heading.heading-0.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "scope" = [
            "heading.2.markdown punctuation.definition.heading.markdown"
            "heading.2.markdown"
            "heading.2.quarto punctuation.definition.heading.quarto"
            "heading.2.quarto"
            "markup.heading.atx.2.mdx"
            "markup.heading.atx.2.mdx punctuation.definition.heading.mdx"
            "markup.heading.setext.2.markdown"
            "markup.heading.heading-1.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "scope" = [
            "heading.3.markdown punctuation.definition.heading.markdown"
            "heading.3.markdown"
            "heading.3.quarto punctuation.definition.heading.quarto"
            "heading.3.quarto"
            "markup.heading.atx.3.mdx"
            "markup.heading.atx.3.mdx punctuation.definition.heading.mdx"
            "markup.heading.heading-2.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "scope" = [
            "heading.4.markdown punctuation.definition.heading.markdown"
            "heading.4.markdown"
            "heading.4.quarto punctuation.definition.heading.quarto"
            "heading.4.quarto"
            "markup.heading.atx.4.mdx"
            "markup.heading.atx.4.mdx punctuation.definition.heading.mdx"
            "markup.heading.heading-3.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "scope" = [
            "heading.5.markdown punctuation.definition.heading.markdown"
            "heading.5.markdown"
            "heading.5.quarto punctuation.definition.heading.quarto"
            "heading.5.quarto"
            "markup.heading.atx.5.mdx"
            "markup.heading.atx.5.mdx punctuation.definition.heading.mdx"
            "markup.heading.heading-4.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "scope" = [
            "heading.6.markdown punctuation.definition.heading.markdown"
            "heading.6.markdown"
            "heading.6.quarto punctuation.definition.heading.quarto"
            "heading.6.quarto"
            "markup.heading.atx.6.mdx"
            "markup.heading.atx.6.mdx punctuation.definition.heading.mdx"
            "markup.heading.heading-5.asciidoc"
          ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "scope" = "markup.bold";
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "bold";
          };
        }
        {
          "scope" = "markup.italic";
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "italic";
          };
        }
        {
          "scope" = "markup.strikethrough";
          "settings" = {
            "foreground" = "#a6adc8";
            "fontStyle" = "strikethrough";
          };
        }
        {
          "name" = "Markdown auto links";
          "scope" = [ "punctuation.definition.link" "markup.underline.link" ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "Markdown links";
          "scope" = [
            "text.html.markdown punctuation.definition.link.title"
            "text.html.quarto punctuation.definition.link.title"
            "string.other.link.title.markdown"
            "string.other.link.title.quarto"
            "markup.link"
            "punctuation.definition.constant.markdown"
            "punctuation.definition.constant.quarto"
            "constant.other.reference.link.markdown"
            "constant.other.reference.link.quarto"
            "markup.substitution.attribute-reference"
          ];
          "settings" = { "foreground" = base16colors.base07; };
        }
        {
          "name" = "Markdown code spans";
          "scope" = [
            "punctuation.definition.raw.markdown"
            "punctuation.definition.raw.quarto"
            "markup.inline.raw.string.markdown"
            "markup.inline.raw.string.quarto"
            "markup.raw.block.markdown"
            "markup.raw.block.quarto"
          ];
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "name" = "Markdown triple backtick language identifier";
          "scope" = "fenced_code.block.language";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Markdown triple backticks";
          "scope" = [
            "markup.fenced_code.block punctuation.definition"
            "markup.raw support.asciidoc"
          ];
          "settings" = { "foreground" = "#9399b2"; };
        }
        {
          "name" = "Markdown quotes";
          "scope" = [ "markup.quote" "punctuation.definition.quote.begin" ];
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Markdown separators";
          "scope" = "meta.separator.markdown";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Markdown list bullets";
          "scope" = [
            "punctuation.definition.list.begin.markdown"
            "punctuation.definition.list.begin.quarto"
            "markup.list.bullet"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Quarto headings";
          "scope" = "markup.heading.quarto";
          "settings" = { "fontStyle" = "bold"; };
        }
        {
          "name" = "Nix attribute names";
          "scope" = [
            "entity.other.attribute-name.multipart.nix"
            "entity.other.attribute-name.single.nix"
          ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "Nix parameter names";
          "scope" = "variable.parameter.name.nix";
          "settings" = {
            "foreground" = base16colors.base05;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Nix interpolated parameter names";
          "scope" = "meta.embedded variable.parameter.name.nix";
          "settings" = {
            "foreground" = base16colors.base07;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Nix paths";
          "scope" = "string.unquoted.path.nix";
          "settings" = {
            "foreground" = base16colors.base0F;
            "fontStyle" = "";
          };
        }
        {
          "name" = "PHP Attributes";
          "scope" = [ "support.attribute.builtin" "meta.attribute.php" ];
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "PHP Parameters (needed for the leading dollar sign)";
          "scope" =
            "meta.function.parameters.php punctuation.definition.variable.php";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "PHP Constants (null, __FILE__, etc.)";
          "scope" = "constant.language.php";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "PHP functions";
          "scope" = "text.html.php support.function";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "PHPdoc keywords";
          "scope" = "keyword.other.phpdoc.php";
          "settings" = { "fontStyle" = ""; };
        }
        {
          "name" =
            "Python argument functions reset to text, otherwise they inherit blue from function-call";
          "scope" = [
            "support.variable.magic.python"
            "meta.function-call.arguments.python"
          ];
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Python double underscore functions";
          "scope" = [ "support.function.magic.python" ];
          "settings" = {
            "foreground" = base16colors.base0C;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Python `self` keyword";
          "scope" = [
            "variable.parameter.function.language.special.self.python"
            "variable.language.special.self.python"
          ];
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "python keyword flow/logical (for ... in)";
          "scope" =
            [ "keyword.control.flow.python" "keyword.operator.logical.python" ];
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "python storage type";
          "scope" = "storage.type.function.python";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "python function support";
          "scope" = [
            "support.token.decorator.python"
            "meta.function.decorator.identifier.python"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "python function calls";
          "scope" = [ "meta.function-call.python" ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "python function decorators";
          "scope" = [
            "entity.name.function.decorator.python"
            "punctuation.definition.decorator.python"
          ];
          "settings" = {
            "foreground" = base16colors.base09;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "python placeholder reset to normal string";
          "scope" = "constant.character.format.placeholder.other.python";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Python exception & builtins such as exit()";
          "scope" = [
            "support.type.exception.python"
            "support.function.builtin.python"
          ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "entity.name.type";
          "scope" = [ "support.type.python" ];
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "python constants (True/False)";
          "scope" = "constant.language.python";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Arguments accessed later in the function body";
          "scope" = [ "meta.indexed-name.python" "meta.item-access.python" ];
          "settings" = {
            "foreground" = base16colors.base08;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Python f-strings/binary/unicode storage types";
          "scope" = "storage.type.string.python";
          "settings" = {
            "foreground" = base16colors.base0B;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Python type hints";
          "scope" = "meta.function.parameters.python";
          "settings" = { "fontStyle" = ""; };
        }
        {
          "name" = "Regex string begin/end in JS/TS";
          "scope" = [
            "string.regexp punctuation.definition.string.begin"
            "string.regexp punctuation.definition.string.end"
          ];
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Regex anchors (^, $)";
          "scope" = "keyword.control.anchor.regexp";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Regex regular string match";
          "scope" = "string.regexp.ts";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" =
            "Regex group parenthesis & backreference (\\1, \\2, \\3, ...)";
          "scope" = [
            "punctuation.definition.group.regexp"
            "keyword.other.back-reference.regexp"
          ];
          "settings" = { "foreground" = base16colors.base0B; };
        }
        {
          "name" = "Regex character class []";
          "scope" = "punctuation.definition.character-class.regexp";
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Regex character classes (\\d, \\w, \\s)";
          "scope" = "constant.other.character-class.regexp";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Regex range";
          "scope" = "constant.other.character-class.range.regexp";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Regex quantifier";
          "scope" = "keyword.operator.quantifier.regexp";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Regex constant/numeric";
          "scope" = "constant.character.numeric.regexp";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" =
            "Regex lookaheads, negative lookaheads, lookbehinds, negative lookbehinds";
          "scope" = [
            "punctuation.definition.group.no-capture.regexp"
            "meta.assertion.look-ahead.regexp"
            "meta.assertion.negative-look-ahead.regexp"
          ];
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "Rust attribute";
          "scope" = [
            "meta.annotation.rust"
            "meta.annotation.rust punctuation"
            "meta.attribute.rust"
            "punctuation.definition.attribute.rust"
          ];
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Rust attribute strings";
          "scope" = [
            "meta.attribute.rust string.quoted.double.rust"
            "meta.attribute.rust string.quoted.single.char.rust"
          ];
          "settings" = { "fontStyle" = ""; };
        }
        {
          "name" = "Rust keyword";
          "scope" = [
            "entity.name.function.macro.rules.rust"
            "storage.type.module.rust"
            "storage.modifier.rust"
            "storage.type.struct.rust"
            "storage.type.enum.rust"
            "storage.type.trait.rust"
            "storage.type.union.rust"
            "storage.type.impl.rust"
            "storage.type.rust"
            "storage.type.function.rust"
            "storage.type.type.rust"
          ];
          "settings" = {
            "foreground" = base16colors.base0E;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Rust u/i32, u/i64, etc.";
          "scope" = "entity.name.type.numeric.rust";
          "settings" = {
            "foreground" = base16colors.base0E;
            "fontStyle" = "";
          };
        }
        {
          "name" = "Rust generic";
          "scope" = "meta.generic.rust";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Rust impl";
          "scope" = "entity.name.impl.rust";
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Rust module";
          "scope" = "entity.name.module.rust";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Rust trait";
          "scope" = "entity.name.trait.rust";
          "settings" = {
            "foreground" = base16colors.base0A;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Rust struct";
          "scope" = "storage.type.source.rust";
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Rust union";
          "scope" = "entity.name.union.rust";
          "settings" = { "foreground" = base16colors.base0A; };
        }
        {
          "name" = "Rust enum member";
          "scope" = "meta.enum.rust storage.type.source.rust";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Rust macro";
          "scope" = [
            "support.macro.rust"
            "meta.macro.rust support.function.rust"
            "entity.name.function.macro.rust"
          ];
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Rust lifetime";
          "scope" =
            [ "storage.modifier.lifetime.rust" "entity.name.type.lifetime" ];
          "settings" = {
            "foreground" = base16colors.base0D;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Rust string formatting";
          "scope" = "string.quoted.double.rust constant.other.placeholder.rust";
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Rust return type generic";
          "scope" =
            "meta.function.return-type.rust meta.generic.rust storage.type.rust";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Rust functions";
          "scope" = "meta.function.call.rust";
          "settings" = { "foreground" = base16colors.base0D; };
        }
        {
          "name" = "Rust angle brackets";
          "scope" = "punctuation.brackets.angle.rust";
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Rust constants";
          "scope" = "constant.other.caps.rust";
          "settings" = { "foreground" = base16colors.base09; };
        }
        {
          "name" = "Rust function parameters";
          "scope" = [ "meta.function.definition.rust variable.other.rust" ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "Rust closure variables";
          "scope" = "meta.function.call.rust variable.other.rust";
          "settings" = { "foreground" = base16colors.base05; };
        }
        {
          "name" = "Rust self";
          "scope" = "variable.language.self.rust";
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "Rust metavariable names";
          "scope" = [
            "variable.other.metavariable.name.rust"
            "meta.macro.metavariable.rust keyword.operator.macro.dollar.rust"
          ];
          "settings" = { "foreground" = base16colors.base0F; };
        }
        {
          "name" = "Shell shebang";
          "scope" = [
            "comment.line.shebang"
            "comment.line.shebang punctuation.definition.comment"
            "comment.line.shebang"
            "punctuation.definition.comment.shebang.shell"
            "meta.shebang.shell"
          ];
          "settings" = {
            "foreground" = base16colors.base0F;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Shell shebang command";
          "scope" = "comment.line.shebang constant.language";
          "settings" = {
            "foreground" = base16colors.base0C;
            "fontStyle" = "italic";
          };
        }
        {
          "name" = "Shell interpolated command";
          "scope" = [
            "meta.function-call.arguments.shell punctuation.definition.variable.shell"
            "meta.function-call.arguments.shell punctuation.section.interpolation"
            "meta.function-call.arguments.shell punctuation.definition.variable.shell"
            "meta.function-call.arguments.shell punctuation.section.interpolation"
          ];
          "settings" = { "foreground" = base16colors.base08; };
        }
        {
          "name" = "Shell interpolated command variable";
          "scope" =
            "meta.string meta.interpolation.parameter.shell variable.other.readwrite";
          "settings" = {
            "foreground" = base16colors.base09;
            "fontStyle" = "italic";
          };
        }
        {
          "scope" = [
            "source.shell punctuation.section.interpolation"
            "punctuation.definition.evaluation.backticks.shell"
          ];
          "settings" = { "foreground" = base16colors.base0C; };
        }
        {
          "name" = "Shell EOF";
          "scope" = "entity.name.tag.heredoc.shell";
          "settings" = { "foreground" = base16colors.base0E; };
        }
        {
          "name" = "Shell quoted variable";
          "scope" = "string.quoted.double.shell variable.other.normal.shell";
          "settings" = { "foreground" = base16colors.base05; };
        }
      ];
    };
    "package.json" = __toJSON {
      name = "${pname}";
      displayName = "${publisher}'s ${pname}";
      version = "${version}";
      publisher = "${publisher}";
      engines.vscode = "^1.22.0";
      contributes.themes = [{
        label = "${publisher}'s ${pname}"; # Xi's theme
        uiTheme = "vs-dark";
        path = "./theme/generated.json";
      }];
      capabilities = {
        untrustedWorkspaces.supported = true;
        virtualWorkspaces = true;
      };
    };
  };

in pkgs.stdenv.mkDerivation {
  inherit version;
  name = "${publisher}-${pname}-${version}";
  installPrefix = "share/vscode/extensions/${vscodeExtUniqueId}";
  passthru = { inherit vscodeExtPublisher vscodeExtName vscodeExtUniqueId; };
  nativeBuildInputs = [ pkgs.unzip ];
  dontPatchELF = true;
  dontStrip = true;

  src = linkFarm "${publisher}.${pname}" (builtins.attrValues (builtins.mapAttrs
    (name: value: {
      name = "${name}";
      path = builtins.toFile (baseNameOf name) value;
    }) theme));

  configurePhase = ''
    runHook preConfigure
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/$installPrefix"
    find . -mindepth 1 -maxdepth 1 | xargs -d'\n' mv -t "$out/$installPrefix/"
    runHook postInstall
  '';
}
