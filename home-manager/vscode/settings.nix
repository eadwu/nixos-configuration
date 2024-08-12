{ pkgs, ... }:

with pkgs;

{
  "diffEditor.ignoreTrimWhitespace" = false;
  "editor.cursorBlinking" = "smooth";
  "editor.cursorSmoothCaretAnimation" = "on";
  "editor.fontFamily" = "'IntelOne Mono', 'Rec Mono Duotone', 'Cascadia Code', 'Anonymous Pro', 'IBM Plex Mono'";
  "editor.fontLigatures" = "'calt','ss01','ss03','ss05','ss08','ss09','ss12','ss20'";
  "editor.fontSize" = 14;
  "editor.fontWeight" = "normal";
  "editor.lineNumbers" = "relative";
  "editor.multiCursorModifier" = "ctrlCmd";
  "editor.quickSuggestions" = {
    "other" = true;
    "comments" = true;
    "strings" = true;
  };
  "editor.renderWhitespace" = "boundary";
  "editor.rulers" = [
    80
    100
  ];
  "editor.smoothScrolling" = true;
  "editor.snippetSuggestions" = "top";
  "editor.suggest.localityBonus" = true;
  "editor.tabSize" = 2;
  "editor.wordWrap" = "off";
  "editor.minimap.showSlider" = "always";
  "telemetry.telemetryLevel" = "off";
  "workbench.colorCustomizations" = {
    "activityBarBadge.background" = "#616161";
    "list.activeSelectionForeground" = "#616161";
    "list.inactiveSelectionForeground" = "#616161";
    "list.highlightForeground" = "#616161";
    "scrollbarSlider.activeBackground" = "#61616150";
    "editorSuggestWidget.highlightForeground" = "#616161";
    "textLink.foreground" = "#616161";
    "progressBar.background" = "#616161";
    "pickerGroup.foreground" = "#616161";
    "tab.activeBorder" = "#616161";
    "notificationLink.foreground" = "#616161";
    "editorWidget.border" = "#616161";
  };
  "workbench.colorTheme" = "Material Theme Ocean";
  "workbench.list.smoothScrolling" = true;
  "workbench.iconTheme" = "eq-material-theme-icons-darker";
  "workbench.sideBar.location" = "right";
  "workbench.tree.expandMode" = "singleClick";
  "breadcrumbs.enabled" = true;
  "window.menuBarVisibility" = "toggle";
  "window.titleBarStyle" = "native";
  "files.associations" = {
    "bspwmrc" = "shellscript";
    "sxhkdrc" = "shellscript";
    "*.proto" = "go";
    "*.pug" = "jade";
    "*.toml" = "ini";
    "*.conkyrc" = "lua";
    "*.xmobarrc" = "haskell";
    ".Xresources" = "shellscript";
  };
  "files.enableTrash" = false;
  "files.exclude" = {
    "**/.git" = false;
    "**/.svn" = true;
    "**/.hg" = true;
    "**/CVS" = true;
    "**/.DS_Store" = false;
    "**/Thumbs.db" = true;
    "**/*.olean" = true;
  };
  "files.insertFinalNewline" = true;
  "files.trimTrailingWhitespace" = true;
  "files.watcherExclude" = {
    "**/.git/objects/**" = true;
    "**/.git/subtree-cache/**" = true;
    "**/node_modules/**" = true;
    "**/.hg/store/**" = true;
    "**/target/debug/**" = true;
    "**/.mypy_cache/**" = true;
    "**/bazel-*/**" = true;
  };
  "explorer.confirmDragAndDrop" = false;
  "explorer.decorations.badges" = false;
  "explorer.decorations.colors" = true;
  "explorer.incrementalNaming" = "smart";
  "explorer.openEditors.visible" = 8;
  "search.smartCase" = true;
  "terminal.external.linuxExec" = "kitty";
  "terminal.integrated.commandsToSkipShell" = [
    "language-julia.interrupt"
  ];
  "scm.defaultViewMode" = "tree";
  "update.mode" = "none";
  "html.format.contentUnformatted" = "pre,code,style,textarea";
  "html.format.extraLiners" = "";
  "html.format.wrapLineLength" = 0;
  "php.validate.run" = "onType";
  "javascript.format.insertSpaceAfterConstructor" = true;
  "javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" = true;
  "javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets" = true;
  "javascript.format.insertSpaceBeforeFunctionParenthesis" = true;
  "javascript.referencesCodeLens.enabled" = true;
  "typescript.format.insertSpaceAfterConstructor" = true;
  "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" = true;
  "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets" = true;
  "typescript.format.insertSpaceBeforeFunctionParenthesis" = true;
  "typescript.implementationsCodeLens.enabled" = true;
  "typescript.referencesCodeLens.enabled" = true;
  "typescript.tsc.autoDetect" = "watch";
  "extensions.autoUpdate" = false;
  "git.autofetch" = true;
  "git.allowForcePush" = true;
  "git.confirmSync" = false;
  "git.detectSubmodules" = false;
  "git.enableCommitSigning" = true;
  "git.enableSmartCommit" = true;
  "git.showPushSuccessNotification" = true;
  "dev.containers.dockerPath" = "podman";
  "emmet.includeLanguages" = {
    "jinja-html" = "html";
  };
  "gitlens.codeLens.scopes" = [
    "document"
    "containers"
    "blocks"
  ];
  "materialTheme.accent" = "Graphite";
  "npm.packageManager" = "yarn";
  "path-intellisense.showHiddenFiles" = true;
  "todo-tree.general.tags" = [ "BUG" "HACK" "FIXME" "TODO" "XXX" "[ ]" "[x]" ];
  "extensions.ignoreRecommendations" = true;
  "gitlens.showWelcomeOnInstall" = false;
  "gitlens.showWhatsNewAfterUpgrades" = false;
  "update.showReleaseNotes" = false;
  "workbench.welcomePage.walkthroughs.openOnInstall" = false;
}
