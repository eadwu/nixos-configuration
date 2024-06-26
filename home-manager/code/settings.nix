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
  "julia.enableTelemetry" = false;
  "julia.symbolCacheDownload" = true;
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
  "C_Cpp.clang_format_path" = "${llvmPackages.clang-unwrapped}/bin/clang-format";
  "C_Cpp.clang_format_fallbackStyle" = "LLVM";
  "C_Cpp.formatting" = "disabled";
  "C_Cpp.workspaceParsingPriority" = "medium";
  "clang.executable" = "${clang}/bin/clang";
  "cmake.cmakePath" = "${cmake}/bin/cmake";
  "emmet.includeLanguages" = {
    "jinja-html" = "html";
  };
  "eslint.nodePath" = "${nodePackages.eslint}/lib/node_modules";
  # "eslint.packageManager" = "yarn";
  "eslint.validate" = [
    "html"
    "javascript"
    "javascriptreact"
  ];
  "gitlens.codeLens.scopes" = [
    "document"
    "containers"
    "blocks"
  ];
  "java.implementationsCodeLens.enabled" = true;
  "java.referencesCodeLens.enabled" = true;
  "java.saveActions.organizeImports" = true;
  "jupyter.disableJupyterAutoStart" = true;
  "jupyter.experiments.enabled" = false;
  # "gopls.expandWorkspaceToModule" = true;
  "haskell.formattingProvider" = "none";
  "haskell.serverExecutablePath" = "\${workspaceFolder}/hie-wrapper.sh";
  "latex-workshop.linting.chktex.enabled" = true;
  "latex-workshop.latex.autoClean.run" = "onBuilt";
  "latex-workshop.latex.tools" = [
    {
      "name" = "latexmk";
      "command" = "latexmk";
      "args" = [
        "-f"
        "-cd"
        "-pdf"
        "-file-line-error"
        "-synctex=1"
        "-interaction=nonstopmode"
        "-outdir=./"
        "-xelatex"
        "%DOC%"
      ];
    }

    {
      "name" = "pdflatex";
      "command" = "pdflatex";
      "args" = [
        "-synctex=1"
        "-interaction=nonstopmode"
        "-file-line-error"
        "%DOC%"
      ];
    }

    {
      "name" = "bibtex";
      "command" = "bibtex";
      "args" = [
        "%DOCFILE%"
      ];
    }
  ];
  "latex-workshop.latexindent.path" = "${texlive.combined.scheme-full}/bin/latexindent";
  "latex-workshop.synctex.path" = "${texlive.combined.scheme-full}/bin/synctex";
  "latex-workshop.texdoc.path" = "${texlive.combined.scheme-full}/bin/texdoc";
  "latex-workshop.view.pdf.viewer" = "tab";
  "materialTheme.accent" = "Graphite";
  "npm.packageManager" = "yarn";
  "path-intellisense.showHiddenFiles" = true;
  "python.analysis.completeFunctionParens" = true;
  "python.defaultInterpreterPath" = "${python3Packages.python}/bin/python3";
  # "python.formatting.provider" = "black";
  # "python.formatting.yapfPath" = "${python3Packages.yapf}/bin/yapf";
  # "python.formatting.blackPath" = "${python3Packages.black}/bin/black";
  "python.languageServer" = "Pylance";
  # "python.linting.flake8Enabled" = true;
  # "python.linting.flake8Path" = "${python3Packages.flake8}/bin/flake8";
  # "python.linting.mypyEnabled" = true;
  # "python.linting.mypyPath" = "${python3Packages.mypy}/bin/mypy";
  # "python.linting.pycodestyleEnabled" = true;
  # "python.linting.pycodestylePath" = "${python3Packages.pycodestyle}/bin/pycodestyle";
  # "python.linting.pydocstyleEnabled" = false;
  # "python.linting.pydocstylePath" = "${python3Packages.pydocstyle}/bin/pydocstyle";
  # "python.linting.pylamaEnabled" = true;
  # "python.linting.pylamaPath" = "${python3Packages.pylama}/bin/pylama";
  # "python.linting.pylintPath" = "${python3Packages.pylint}/bin/pylint";
  "python.testing.unittestEnabled" = true;
  "maven.executable.path" = "${maven}/bin/mvn";
  "maven.terminal.useJavaHome" = true;
  "rust-analyzer.server.path" = "${rust-analyzer}/bin/rust-analyzer";
  "sqlite.sqlite3" = "${sqlite}/bin/sqlite3";
  "todo-tree.general.tags" = [ "BUG" "HACK" "FIXME" "TODO" "XXX" "[ ]" "[x]" ];
  # https://gist.github.com/hyperupcall/99e355405611be6c4e0a38b6e3e8aad0
  # "clangd.checkUpdates" = false;
  # "code-runner.enableAppInsights" = false;
  # "docker-explorer.enableTelemetry" = false;
  "extensions.ignoreRecommendations" = true;
  "gitlens.showWelcomeOnInstall" = false;
  "gitlens.showWhatsNewAfterUpgrades" = false;
  "java.help.firstView" = "none";
  "java.help.showReleaseNotes" = false;
  # "kite.showWelcomeNotificationOnStartup" = false;
  # "liveServer.settings.donotShowInfoMsg" = true;
  # "Lua.telemetry.enable" = false;
  # "material-icon-theme.showWelcomeMessage" = false;
  # "pros.showWelcomeOnStartup" = false;
  # "pros.useGoogleAnalytics" = false;
  "redhat.telemetry.enabled" = false;
  # "rpcServer.showStartupMessage" = false;
  # "shellcheck.disableVersionCheck" = true;
  # "sonarlint.disableTelemetry" = true;
  # "telemetry.enableCrashReporter" = false;
  # "telemetry.enableTelemetry" = false;
  # "terraform.telemetry.enabled" = false;
  "update.showReleaseNotes" = false;
  # "vsicons.dontShowNewVersionMessage" = true;
  "workbench.welcomePage.walkthroughs.openOnInstall" = false;
}
