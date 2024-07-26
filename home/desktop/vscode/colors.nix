schema:

let c = schema.colors // schema.harmonized;
in {
  "workbench.colorCustomizations" = {
    "foreground" = "${c.on_surface}";
    "disabledForeground" = "${c.on_surface_variant}";
    "widget.shadow" = "${c.surface}";
    "selection.background" = "${c.blue}";
    "descriptionForeground" = "${c.primary_container}";
    "errorForeground" = "${c.red}";
    "icon.foreground" = "${c.on_surface_variant}";

    "textBlockQuote.background" = "${c.surface_variant}";
    "textBlockQuote.border" = "${c.blue}";
    "textCodeBlock.background" = "${c.surface}";
    "textLink.activeForeground" = "${c.cyan}";
    "textLink.foreground" = "${c.blue}";
    "textPreformat.foreground" = "${c.blue}";
    "textSeparator.foreground" = "#f0f";

    "toolbar.hoverBackground" = "${c.tertiary_container}";
    "toolbar.activeBackground" = "${c.primary_container}";

    "button.background" = "${c.blue}";
    "button.foreground" = "${c.on_primary_container}";
    "button.hoverBackground" = "${c.on_surface_variant}";
    "button.secondaryForeground" = "${c.on_primary_container}";
    "button.secondaryBackground" = "${c.magenta}";
    "button.secondaryHoverBackground" = "${c.on_surface_variant}";
    "checkbox.background" = "${c.surface}";
    "checkbox.foreground" = "${c.on_surface}";

    "dropdown.background" = "${c.surface}";
    "dropdown.listBackground" = "${c.surface}";
    "dropdown.foreground" = "${c.on_surface}";

    "input.background" = "${c.surface}";
    "input.foreground" = "${c.on_surface}";
    "input.placeholderForeground" = "${c.primary_container}";
    "inputOption.activeBackground" = "${c.tertiary_container}";
    "inputOption.activeBorder" = "${c.primary}";
    "inputOption.activeForeground" = "${c.on_surface}";
    "inputValidation.errorBackground" = "${c.red}";
    "inputValidation.errorForeground" = "${c.on_surface}";
    "inputValidation.errorBorder" = "${c.red}";
    "inputValidation.infoBackground" = "${c.blue}";
    "inputValidation.infoForeground" = "${c.on_surface}";
    "inputValidation.infoBorder" = "${c.blue}";
    "inputValidation.warningBackground" = "${c.yellow}";
    "inputValidation.warningForeground" = "${c.on_surface}";
    "inputValidation.warningBorder" = "${c.yellow}";

    "scrollbar.shadow" = "${c.surface_variant}";
    "scrollbarSlider.activeBackground" = "${c.on_surface_variant}";
    "scrollbarSlider.background" = "${c.tertiary_container}";
    "scrollbarSlider.hoverBackground" = "${c.primary_container}";

    "badge.background" = "${c.surface}";
    "badge.foreground" = "${c.on_surface}";

    "progressBar.background" = "${c.primary_container}";

    "list.activeSelectionBackground" = "${c.surface_variant}";
    "list.inactiveSelectionBackground" = "${c.surface_variant}";
    "list.focusBackground" = "${c.surface_variant}";
    "list.hoverBackground" = "${c.surface_variant}";

    "list.activeSelectionForeground" = "${c.on_surface}";
    "list.dropBackground" = "${c.on_primary_container}";
    "list.focusForeground" = "${c.on_surface}";
    "list.highlightForeground" = "${c.on_primary_container}";
    "list.hoverForeground" = "${c.on_surface}";
    "list.inactiveSelectionForeground" = "${c.on_surface}";
    "list.inactiveFocusBackground" = "${c.tertiary_container}";
    "list.invalidItemForeground" = "${c.red}";
    "list.errorForeground" = "${c.red}";
    "list.warningForeground" = "${c.yellow}";
    "listFilterWidget.background" = "${c.surface}";
    "listFilterWidget.noMatchesOutline" = "${c.red}";
    "list.filterMatchBackground" = "${c.tertiary_container}";
    "tree.indentGuidesStroke" = "${c.on_surface}";

    "activityBar.background" = "${c.surface}";
    "activityBar.dropBackground" = "${c.on_primary_container}";
    "activityBar.foreground" = "${c.on_surface}";
    "activityBar.inactiveForeground" = "${c.primary_container}";
    "activityBarBadge.background" = "${c.blue}";
    "activityBarBadge.foreground" = "${c.on_primary_container}";
    "activityBar.activeBackground" = "${c.tertiary_container}";

    "sideBar.background" = "${c.surface}";
    "sideBar.foreground" = "${c.on_surface}";
    "sideBar.dropBackground" = "${c.surface}";
    "sideBarTitle.foreground" = "${c.surface}";
    "sideBarSectionHeader.background" = "${c.surface}";
    "sideBarSectionHeader.foreground" = "${c.on_surface}";

    "minimap.findMatchHighlight" = "${c.yellow}";
    "minimap.selectionHighlight" = "${c.tertiary_container}";
    "minimap.errorHighlight" = "${c.red}";
    "minimap.warningHighlight" = "${c.yellow}";
    "minimap.background" = "${c.surface}";
    "minimap.selectionOccurrenceHighlight" = "${c.primary_container}";
    "minimapGutter.addedBackground" = "${c.green}";
    "minimapGutter.modifiedBackground" = "${c.magenta}";
    "minimapGutter.deletedBackground" = "${c.red}";

    "editorGroup.background" = "${c.surface}";
    "editorGroup.dropBackground" = "${c.tertiary_container}";
    "editorGroupHeader.noTabsBackground" = "${c.surface}";
    "editorGroupHeader.tabsBackground" = "${c.surface}";
    "editorGroup.emptyBackground" = "${c.surface}";
    "editorGroup.dropIntoPromptForeground" = "${c.on_tertiary_container}";
    "editorGroup.dropIntoPromptBackground" = "${c.surface}";
    "tab.activeBackground" = "${c.surface}";
    "tab.unfocusedActiveBackground" = "${c.surface}";
    "tab.activeForeground" = "${c.on_surface}";
    "tab.inactiveBackground" = "${c.surface_variant}";
    "tab.inactiveForeground" = "${c.primary_container}";
    "tab.unfocusedActiveForeground" = "${c.on_surface_variant}";
    "tab.unfocusedInactiveForeground" = "${c.primary_container}";
    "tab.hoverBackground" = "${c.tertiary_container}";
    "tab.unfocusedHoverBackground" = "${c.tertiary_container}";
    "tab.activeModifiedBorder" = "${c.blue}";
    "tab.inactiveModifiedBorder" = "${c.blue}";
    "tab.unfocusedActiveModifiedBorder" = "${c.blue}";
    "tab.unfocusedInactiveModifiedBorder" = "${c.blue}";
    "editorPane.background" = "${c.surface}";

    "editor.background" = "${c.surface}";
    "editor.foreground" = "${c.on_surface}";
    "editorLineNumber.foreground" = "${c.primary_container}";
    "editorLineNumber.activeForeground" = "${c.on_surface_variant}";
    "editorCursor.foreground" = "${c.on_surface}";
    "editor.selectionBackground" = "${c.tertiary_container}";
    "editor.inactiveSelectionBackground" = "${c.tertiary_container}";
    "editor.selectionHighlightBackground" = "${c.surface_variant}";
    "editor.wordHighlightBackground" = "${c.tertiary_container}";
    "editor.wordHighlightStrongBackground" = "${c.primary_container}";
    "editor.findMatchBackground" = "${c.yellow}";
    "editor.findMatchHighlightBackground" = "${c.primary}";
    "editor.findRangeHighlightBackground" = "${c.surface_variant}";
    "searchEditor.findMatchBackground" = "${c.yellow}";
    "editor.hoverHighlightBackground" = "${c.tertiary_container}";
    "editor.lineHighlightBackground" = "${c.surface_variant}";
    "editorLink.activeForeground" = "${c.blue}";
    "editor.rangeHighlightBackground" = "${c.surface_variant}";
    "editorWhitespace.foreground" = "${c.primary_container}";
    "editorIndentGuide.background" = "${c.primary_container}";
    "editorIndentGuide.activeBackground" = "${c.on_surface_variant}";
    "editorInlayHint.background" = "${c.surface_variant}";
    "editorInlayHint.foreground" = "${c.on_surface}";
    "editorInlayHint.typeBackground" = "${c.surface_variant}";
    "editorInlayHint.typeForeground" = "${c.on_surface}";
    "editorInlayHint.parameterBackground" = "${c.surface_variant}";
    "editorInlayHint.parameterForeground" = "${c.on_surface}";
    "editorRuler.foreground" = "${c.primary_container}";
    "editorCodeLens.foreground" = "${c.tertiary_container}";
    "editorLightBulb.foreground" = "${c.yellow}";
    "editorLightBulbAutoFix.foreground" = "${c.blue}";
    "editorBracketMatch.background" = "${c.tertiary_container}";
    "editorBracketHighlight.foreground1" = "${c.red}";
    "editorBracketHighlight.foreground2" = "${c.primary}";
    "editorBracketHighlight.foreground3" = "${c.yellow}";
    "editorBracketHighlight.foreground4" = "${c.green}";
    "editorBracketHighlight.foreground5" = "${c.blue}";
    "editorBracketHighlight.foreground6" = "${c.magenta}";
    "editorBracketHighlight.unexpectedBracket.foreground" = "${c.error}";
    "editorOverviewRuler.findMatchForeground" = "${c.yellow}";
    "editorOverviewRuler.rangeHighlightForeground" = "${c.primary_container}";
    "editorOverviewRuler.selectionHighlightForeground" =
      "${c.tertiary_container}";
    "editorOverviewRuler.wordHighlightForeground" = "${c.on_primary_container}";
    "editorOverviewRuler.wordHighlightStrongForeground" = "${c.blue}";
    "editorOverviewRuler.modifiedForeground" = "${c.magenta}";
    "editorOverviewRuler.addedForeground" = "${c.green}";
    "editorOverviewRuler.deletedForeground" = "${c.red}";
    "editorOverviewRuler.errorForeground" = "${c.red}";
    "editorOverviewRuler.warningForeground" = "${c.yellow}";
    "editorOverviewRuler.infoForeground" = "${c.cyan}";
    "editorOverviewRuler.bracketMatchForeground" = "${c.on_tertiary_container}";
    "editorError.foreground" = "${c.red}";
    "editorWarning.foreground" = "${c.yellow}";
    "editorInfo.foreground" = "${c.cyan}";
    "editorHint.foreground" = "${c.blue}";
    "problemsErrorIcon.foreground" = "${c.red}";
    "problemsWarningIcon.foreground" = "${c.yellow}";
    "problemsInfoIcon.foreground" = "${c.cyan}";
    "editorGutter.background" = "${c.surface}";
    "editorGutter.modifiedBackground" = "${c.magenta}";
    "editorGutter.addedBackground" = "${c.green}";
    "editorGutter.deletedBackground" = "${c.red}";
    "editorGutter.commentRangeForeground" = "${c.on_surface_variant}";
    "editorGutter.foldingControlForeground" = "${c.on_surface}";

    "diffEditor.insertedTextBackground" = "${c.green}";
    "diffEditor.removedTextBackground" = "${c.red}";
    "diffEditor.diagonalFill" = "${c.tertiary_container}";

    "editorWidget.foreground" = "${c.on_surface}";
    "editorWidget.background" = "${c.surface}";
    "editorSuggestWidget.background" = "${c.surface_variant}";
    "editorSuggestWidget.foreground" = "${c.on_surface}";
    "editorSuggestWidget.focusHighlightForeground" =
      "${c.on_primary_container}";
    "editorSuggestWidget.highlightForeground" = "${c.blue}";
    "editorSuggestWidget.selectedBackground" = "${c.tertiary_container}";
    "editorSuggestWidget.selectedForeground" = "${c.on_tertiary_container}";
    "editorHoverWidget.foreground" = "${c.on_surface}";
    "editorHoverWidget.background" = "${c.surface}";
    "debugExceptionWidget.background" = "${c.surface_variant}";
    "editorMarkerNavigation.background" = "${c.surface_variant}";
    "editorMarkerNavigationError.background" = "${c.red}";
    "editorMarkerNavigationWarning.background" = "${c.yellow}";
    "editorMarkerNavigationInfo.background" = "${c.blue}";
    "editorMarkerNavigationError.headerBackground" = "${c.red}";
    "editorMarkerNavigationWarning.headerBackground" = "${c.yellow}";
    "editorMarkerNavigationInfo.headerBackground" = "${c.cyan}";

    "peekViewEditor.background" = "${c.surface_variant}";
    "peekViewEditorGutter.background" = "${c.surface_variant}";
    "peekViewEditor.matchHighlightBackground" = "${c.primary}";
    "peekViewResult.background" = "${c.surface}";
    "peekViewResult.fileForeground" = "${c.on_surface}";
    "peekViewResult.lineForeground" = "${c.primary_container}";
    "peekViewResult.matchHighlightBackground" = "${c.primary}";
    "peekViewResult.selectionBackground" = "${c.tertiary_container}";
    "peekViewResult.selectionForeground" = "${c.on_surface}";
    "peekViewTitle.background" = "${c.tertiary_container}";
    "peekViewTitleDescription.foreground" = "${c.primary_container}";
    "peekViewTitleLabel.foreground" = "${c.on_surface}";

    "merge.currentContentBackground" = "${c.blue}40";
    "merge.currentHeaderBackground" = "${c.blue}40";
    "merge.incomingContentBackground" = "${c.green}60";
    "merge.incomingHeaderBackground" = "${c.green}60";
    "editorOverviewRuler.currentContentForeground" = "${c.blue}";
    "editorOverviewRuler.incomingContentForeground" = "${c.green}";
    "editorOverviewRuler.commonContentForeground" = "${c.error}";

    "panel.background" = "${c.surface}";
    "panel.dropBackground" = "${c.surface_variant}";
    "panel.dropBorder" = "${c.surface_variant}";
    "panelTitle.activeForeground" = "${c.on_surface}";
    "panelTitle.inactiveForeground" = "${c.primary_container}";

    "statusBar.border" = "${c.surface}";
    "statusBar.background" = "${c.surface}";
    "statusBar.foreground" = "${c.primary_container}";
    "statusBar.debuggingBackground" = "${c.primary}";
    "statusBar.debuggingForeground" = "${c.on_primary_container}";
    "statusBar.noFolderBackground" = "${c.magenta}";
    "statusBar.noFolderForeground" = "${c.on_primary_container}";
    "statusBarItem.activeBackground" = "${c.surface}";
    "statusBarItem.hoverBackground" = "${c.tertiary_container}";
    "statusBarItem.prominentForeground" = "${c.on_primary_container}";
    "statusBarItem.prominentBackground" = "${c.magenta}";
    "statusBarItem.prominentHoverBackground" = "${c.red}";
    "statusBarItem.remoteBackground" = "${c.green}";
    "statusBarItem.remoteForeground" = "${c.on_primary_container}";
    "statusBarItem.errorBackground" = "${c.red}";
    "statusBarItem.errorForeground" = "${c.on_primary_container}";
    "statusBarItem.warningBackground" = "${c.yellow}";
    "statusBarItem.warningForeground" = "${c.on_primary_container}";

    "titleBar.activeBackground" = "${c.surface}";
    "titleBar.activeForeground" = "${c.on_surface}";
    "titleBar.inactiveBackground" = "${c.surface_variant}";
    "titleBar.inactiveForeground" = "${c.primary_container}";

    "menubar.selectionForeground" = "${c.on_surface}";
    "menubar.selectionBackground" = "${c.surface_variant}";
    "menu.foreground" = "${c.on_surface}";
    "menu.background" = "${c.surface_variant}";
    "menu.selectionForeground" = "${c.on_surface}";
    "menu.selectionBackground" = "${c.tertiary_container}";
    "menu.separatorBackground" = "${c.on_primary_container}";

    "commandCenter.foreground" = "${c.on_surface}";
    "commandCenter.activeForeground" = "${c.on_primary_container}";
    "commandCenter.background" = "${c.surface}";
    "commandCenter.activeBackground" = "${c.surface_variant}";

    "notificationCenterHeader.foreground" = "${c.on_surface}";
    "notificationCenterHeader.background" = "${c.surface_variant}";
    "notifications.foreground" = "${c.on_surface}";
    "notifications.background" = "${c.tertiary_container}";
    "notificationLink.foreground" = "${c.blue}";
    "notificationsErrorIcon.foreground" = "${c.red}";
    "notificationsWarningIcon.foreground" = "${c.yellow}";
    "notificationsInfoIcon.foreground" = "${c.blue}";

    "notification.background" = "${c.tertiary_container}";
    "notification.foreground" = "${c.on_surface}";
    "notification.buttonBackground" = "${c.blue}";
    "notification.buttonHoverBackground" = "${c.tertiary_container}";
    "notification.buttonForeground" = "${c.on_primary_container}";
    "notification.infoBackground" = "${c.cyan}";
    "notification.infoForeground" = "${c.on_primary_container}";
    "notification.warningBackground" = "${c.yellow}";
    "notification.warningForeground" = "${c.on_primary_container}";
    "notification.errorBackground" = "${c.red}";
    "notification.errorForeground" = "${c.on_primary_container}";

    "banner.background" = "${c.tertiary_container}";
    "banner.foreground" = "${c.on_surface}";
    "banner.iconForeground" = "${c.blue}";

    "extensionButton.prominentBackground" = "${c.green}";
    "extensionButton.prominentForeground" = "${c.on_primary_container}";
    "extensionButton.prominentHoverBackground" = "${c.tertiary_container}";
    "extensionBadge.remoteBackground" = "${c.primary}";
    "extensionBadge.remoteForeground" = "${c.on_primary_container}";
    "extensionIcon.starForeground" = "${c.yellow}";
    "extensionIcon.verifiedForeground" = "${c.blue}";
    "extensionIcon.preReleaseForeground" = "${c.primary}";

    "pickerGroup.foreground" = "${c.primary_container}";
    "quickInput.background" = "${c.surface_variant}";
    "quickInput.foreground" = "${c.on_surface}";
    "quickInputList.focusBackground" = "${c.primary_container}";
    "quickInputList.focusForeground" = "${c.on_primary_container}";
    "quickInputList.focusIconForeground" = "${c.on_primary_container}";

    "keybindingLabel.background" = "${c.tertiary_container}";
    "keybindingLabel.foreground" = "${c.on_surface}";

    "keybindingTable.headerBackground" = "${c.tertiary_container}";
    "keybindingTable.rowsBackground" = "${c.surface_variant}";

    "terminal.background" = "${c.surface}";
    "terminal.foreground" = "${c.on_surface}";
    "terminal.ansiBlack" = "${c.surface}";
    "terminal.ansiRed" = "${c.red}";
    "terminal.ansiGreen" = "${c.green}";
    "terminal.ansiYellow" = "${c.yellow}";
    "terminal.ansiBlue" = "${c.blue}";
    "terminal.ansiMagenta" = "${c.magenta}";
    "terminal.ansiCyan" = "${c.cyan}";
    "terminal.ansiWhite" = "${c.on_surface}";
    "terminal.ansiBrightBlack" = "${c.primary_container}";
    "terminal.ansiBrightRed" = "${c.red}";
    "terminal.ansiBrightGreen" = "${c.green}";
    "terminal.ansiBrightYellow" = "${c.yellow}";
    "terminal.ansiBrightBlue" = "${c.blue}";
    "terminal.ansiBrightMagenta" = "${c.magenta}";
    "terminal.ansiBrightCyan" = "${c.cyan}";
    "terminal.ansiBrightWhite" = "${c.on_primary_container}";
    "terminalCursor.foreground" = "${c.on_surface}";
    "terminalOverviewRuler.cursorForeground" = "#ff0000";
    "terminalOverviewRuler.findMatchForeground" = "#ff0000";

    "debugToolBar.background" = "${c.surface_variant}";
    "debugView.stateLabelForeground" = "${c.on_primary_container}";
    "debugView.stateLabelBackground" = "${c.blue}";
    "debugView.valueChangedHighlight" = "${c.blue}";
    "debugTokenExpression.name" = "${c.magenta}";
    "debugTokenExpression.value" = "${c.on_surface}";
    "debugTokenExpression.string" = "${c.green}";
    "debugTokenExpression.boolean" = "${c.primary}";
    "debugTokenExpression.number" = "${c.primary}";
    "debugTokenExpression.error" = "${c.red}";

    "testing.iconFailed" = "${c.red}";
    "testing.iconErrored" = "${c.error}";
    "testing.iconPassed" = "${c.green}";
    "testing.runAction" = "${c.on_surface_variant}";
    "testing.iconQueued" = "${c.yellow}";
    "testing.iconUnset" = "${c.on_surface_variant}";
    "testing.iconSkipped" = "${c.magenta}";
    "testing.peekHeaderBackground" = "${c.surface_variant}";
    "testing.message.error.decorationForeground" = "${c.on_surface}";
    "testing.message.error.lineBackground" = "${c.red}";
    "testing.message.info.decorationForeground" = "${c.on_surface}";
    "testing.message.info.lineBackground" = "${c.blue}";

    "welcomePage.background" = "${c.surface}";
    "welcomePage.buttonBackground" = "${c.surface_variant}";
    "welcomePage.buttonHoverBackground" = "${c.tertiary_container}";
    "welcomePage.progress.background" = "${c.primary_container}";
    "welcomePage.progress.foreground" = "${c.blue}";
    "welcomePage.tileBackground" = "${c.surface_variant}";
    "welcomePage.tileHoverBackground" = "${c.tertiary_container}";
    "walkThrough.embeddedEditorBackground" = "${c.surface}";

    "gitDecoration.addedResourceForeground" = "${c.green}";
    "gitDecoration.modifiedResourceForeground" = "${c.magenta}";
    "gitDecoration.deletedResourceForeground" = "${c.red}";
    "gitDecoration.renamedResourceForeground" = "${c.cyan}";
    "gitDecoration.stageModifiedResourceForeground" = "${c.magenta}";
    "gitDecoration.stageDeletedResourceForeground" = "${c.red}";
    "gitDecoration.untrackedResourceForeground" = "${c.primary}";
    "gitDecoration.ignoredResourceForeground" = "${c.primary_container}";
    "gitDecoration.conflictingResourceForeground" = "${c.yellow}";
    "gitDecoration.submoduleResourceForeground" = "${c.error}";

    "settings.headerForeground" = "${c.on_surface}";
    "settings.modifiedItemIndicator" = "${c.blue}";
    "settings.modifiedItemForeground" = "${c.green}";
    "settings.dropdownBackground" = "${c.surface_variant}";
    "settings.dropdownForeground" = "${c.on_surface}";
    "settings.checkboxBackground" = "${c.surface_variant}";
    "settings.checkboxForeground" = "${c.on_surface}";
    "settings.rowHoverBackground" = "${c.tertiary_container}";
    "settings.textInputBackground" = "${c.surface_variant}";
    "settings.textInputForeground" = "${c.on_surface}";
    "settings.numberInputBackground" = "${c.surface_variant}";
    "settings.numberInputForeground" = "${c.on_surface}";
    "settings.focusedRowBackground" = "${c.tertiary_container}";
    "settings.headerBorder" = "${c.on_surface}";
    "settings.sashBorder" = "${c.on_surface}";

    "breadcrumb.foreground" = "${c.on_surface}";
    "breadcrumb.background" = "${c.surface_variant}";
    "breadcrumb.focusForeground" = "${c.on_tertiary_container}";
    "breadcrumb.activeSelectionForeground" = "${c.on_primary_container}";
    "breadcrumbPicker.background" = "${c.surface_variant}";

    "editor.snippetTabstopHighlightBackground" = "${c.tertiary_container}";
    "editor.snippetFinalTabstopHighlightBackground" = "${c.primary_container}";

    "symbolIcon.arrayForeground" = "${c.on_surface}";
    "symbolIcon.booleanForeground" = "${c.primary}";
    "symbolIcon.classForeground" = "${c.yellow}";
    "symbolIcon.colorForeground" = "#f0f";
    "symbolIcon.constantForeground" = "${c.primary}";
    "symbolIcon.constructorForeground" = "${c.blue}";
    "symbolIcon.enumeratorForeground" = "${c.primary}";
    "symbolIcon.enumeratorMemberForeground" = "${c.blue}";
    "symbolIcon.eventForeground" = "${c.yellow}";
    "symbolIcon.fieldForeground" = "${c.red}";
    "symbolIcon.fileForeground" = "${c.on_surface}";
    "symbolIcon.folderForeground" = "${c.on_surface}";
    "symbolIcon.functionForeground" = "${c.blue}";
    "symbolIcon.interfaceForeground" = "${c.blue}";
    "symbolIcon.keyForeground" = "#f0f";
    "symbolIcon.keywordForeground" = "${c.magenta}";
    "symbolIcon.methodForeground" = "${c.blue}";
    "symbolIcon.moduleForeground" = "${c.on_surface}";
    "symbolIcon.namespaceForeground" = "${c.on_surface}";
    "symbolIcon.nullForeground" = "${c.error}";
    "symbolIcon.numberForeground" = "${c.primary}";
    "symbolIcon.objectForeground" = "#f0f";
    "symbolIcon.operatorForeground" = "#f0f";
    "symbolIcon.packageForeground" = "#f0f";
    "symbolIcon.propertyForeground" = "${c.on_surface}";
    "symbolIcon.referenceForeground" = "#f0f";
    "symbolIcon.snippetForeground" = "${c.on_surface}";
    "symbolIcon.stringForeground" = "${c.green}";
    "symbolIcon.structForeground" = "${c.yellow}";
    "symbolIcon.textForeground" = "${c.on_surface}";
    "symbolIcon.typeParameterForeground" = "#f0f";
    "symbolIcon.unitForeground" = "#f0f";
    "symbolIcon.variableForeground" = "${c.red}";

    "debugIcon.breakpointForeground" = "${c.red}";
    "debugIcon.breakpointDisabledForeground" = "${c.on_surface_variant}";
    "debugIcon.breakpointUnverifiedForeground" = "${c.tertiary_container}";
    "debugIcon.breakpointCurrentStackframeForeground" = "${c.yellow}";
    "debugIcon.breakpointStackframeForeground" = "${c.error}";
    "debugIcon.startForeground" = "${c.green}";
    "debugIcon.pauseForeground" = "${c.blue}";
    "debugIcon.stopForeground" = "${c.red}";
    "debugIcon.disconnectForeground" = "${c.red}";
    "debugIcon.restartForeground" = "${c.green}";
    "debugIcon.stepOverForeground" = "${c.blue}";
    "debugIcon.stepIntoForeground" = "${c.cyan}";
    "debugIcon.stepOutForeground" = "${c.magenta}";
    "debugIcon.continueForeground" = "${c.green}";
    "debugIcon.stepBackForeground" = "${c.error}";
    "debugConsole.infoForeground" = "${c.on_surface}";
    "debugConsole.warningForeground" = "${c.yellow}";
    "debugConsole.errorForeground" = "${c.red}";
    "debugConsole.sourceForeground" = "${c.on_surface}";
    "debugConsoleInputIcon.foreground" = "${c.on_surface}";

    "notebook.editorBackground" = "${c.surface}";
    "notebook.cellBorderColor" = "${c.primary_container}";
    "notebook.cellHoverBackground" = "${c.surface_variant}";
    "notebook.cellToolbarSeparator" = "${c.tertiary_container}";
    "notebook.cellEditorBackground" = "${c.surface}";
    "notebook.focusedCellBackground" = "${c.tertiary_container}";
    "notebook.focusedCellBorder" = "${c.blue}";
    "notebook.focusedEditorBorder" = "${c.blue}";
    "notebook.inactiveFocusedCellBorder" = "${c.primary_container}";
    "notebook.selectedCellBackground" = "${c.tertiary_container}";
    "notebookStatusErrorIcon.foreground" = "${c.red}";
    "notebookStatusRunningIcon.foreground" = "${c.cyan}";
    "notebookStatusSuccessIcon.foreground" = "${c.green}";

    "charts.foreground" = "${c.on_surface}";
    "charts.lines" = "${c.on_surface}";
    "charts.red" = "${c.red}";
    "charts.blue" = "${c.blue}";
    "charts.yellow" = "${c.yellow}";
    "charts.orange" = "${c.primary}";
    "charts.green" = "${c.green}";
    "charts.purple" = "${c.magenta}";

    "ports.iconRunningProcessForeground" = "${c.primary}";
  };
}
