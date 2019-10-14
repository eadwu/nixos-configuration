{ pkgs, ... }:

with pkgs;

let
  JAVA_HOME = "${openjdk}/lib/openjdk";
in {
  "editor.codeActionsOnSave" = {
    "source.organizeImports" = true;
  };
  "editor.cursorBlinking" = "smooth";
  "editor.fontFamily" = "'Anonymous Pro', 'IBM Plex Mono'";
  "editor.fontLigatures" = true;
  "editor.fontSize" = 12;
  "editor.fontWeight" = "normal";
  "editor.formatOnSave" = true;
  "editor.lineHeight" = 20;
  "editor.lineNumbers" = "relative";
  "editor.multiCursorModifier" = "ctrlCmd";
  "editor.quickSuggestions" = {
    "other" = true;
    "comments" = true;
    "strings" = true;
  };
  "editor.renderIndentGuides" = false;
  "editor.renderWhitespace" = "boundary";
  "editor.rulers" = [
    80
    100
  ];
  "editor.smoothScrolling" = true;
  "editor.snippetSuggestions" = "top";
  "editor.tabSize" = 2;
  "editor.wordWrap" = "off";
  "editor.minimap.showSlider" = "always";
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
  "workbench.colorTheme" = "Noctis Minimus";
  "workbench.iconTheme" = "eq-material-theme-icons-ocean";
  "workbench.sideBar.location" = "right";
  "breadcrumbs.enabled" = true;
  "window.menuBarVisibility" = "toggle";
  "window.titleBarStyle" = "native";
  "files.associations" = {
    "bspwmrc" = "shellscript";
    "sxhkdrc" = "shellscript";
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
  };
  "files.insertFinalNewline" = true;
  "files.trimTrailingWhitespace" = true;
  "explorer.confirmDragAndDrop" = false;
  "explorer.decorations.badges" = false;
  "explorer.decorations.colors" = true;
  "search.smartCase" = true;
  "terminal.external.linuxExec" = "st";
  "scm.alwaysShowProviders" = true;
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
  "git.enableCommitSigning" = true;
  "git.enableSmartCommit" = true;
  "git.showPushSuccessNotification" = true;
  "C_Cpp.clang_format_path" = "${llvmPackages.clang-unwrapped}/bin/clang-format";
  "C_Cpp.clang_format_fallbackStyle" = "LLVM";
  "C_Cpp.formatting" = "Disabled";
  "cmake.cmakePath" = "${cmake}/bin/cmake";
  "docker.attachShellCommand.linuxContainer" = "${zsh}/bin/zsh";
  "emmet.includeLanguages" = {
    "jinja-html" = "html";
  };
  "eslint.nodePath" = "${nodePackages.eslint}/lib/node_modules";
  "eslint.packageManager" = "yarn";
  "eslint.validate" = [
    "html"
    "javascript"
    "javascriptreact"
  ];
  "filesize.use24HourFormat" = false;
  "FSharp.dotnetLocation" = "${dotnet-sdk}/bin/dotnet";
  "FSharp.fsiFilePath" = "${fsharp}/bin/fsharpi";
  "FSharp.monoPath" = "${mono}/bin/mono";
  "gitlens.advanced.messages" = {
    "suppressCommitHasNoPreviousCommitWarning" = false;
    "suppressCommitNotFoundWarning" = false;
    "suppressFileNotUnderSourceControlWarning" = false;
    "suppressGitVersionWarning" = false;
    "suppressLineUncommittedWarning" = false;
    "suppressNoRepositoryWarning" = false;
    "suppressResultsExplorerNotice" = true;
    "suppressShowKeyBindingsNotice" = true;
    "suppressUpdateNotice" = false;
    "suppressWelcomeNotice" = true;
  };
  "gitlens.codeLens.scopes" = [
    "document"
    "containers"
    "blocks"
  ];
  "gitlens.keymap" = "alternate";
  "java.home" = JAVA_HOME;
  "java.implementationsCodeLens.enabled" = true;
  "java.referencesCodeLens.enabled" = true;
  "java.saveActions.organizeImports" = true;
  "languageServerHaskell.formattingProvider" = "none";
  "languageServerHaskell.useCustomHieWrapper" = true;
  "languageServerHaskell.useCustomHieWrapperPath" = "\${workspaceFolder}/hie-wrapper.sh";
  "latex-workshop.chktex.enabled" = true;
  "latex-workshop.chktex.path" = "${texlive.combined.scheme-full}/bin/chktex";
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
  "latex-workshop.texcount.path" = "${texlive.combined.scheme-full}/bin/texcount";
  "latex-workshop.view.pdf.viewer" = "tab";
  "materialTheme.accent" = "Graphite";
  "npm.packageManager" = "yarn";
  "path-intellisense.showHiddenFiles" = true;
  "python.autoComplete.addBrackets" = true;
  "python.autoUpdateLanguageServer" = false;
  "python.formatting.provider" = "yapf";
  "python.formatting.yapfPath" = "${python3.pkgs.yapf}/bin/yapf";
  "python.jediEnabled" = false;
  "python.linting.flake8Enabled" = true;
  "python.linting.flake8Path" = "${python3.pkgs.flake8}/bin/flake8";
  "python.linting.mypyEnabled" = false;
  "python.linting.mypyPath" = "${python3.pkgs.mypy}/bin/mypy";
  "python.linting.pep8Enabled" = true;
  "python.linting.pep8Path" = "${python3.pkgs.pep8}/bin/pep8";
  "python.linting.pydocstyleEnabled" = true;
  "python.linting.pydocstylePath" = "${python3.pkgs.pydocstyle}/bin/pydocstyle";
  "python.linting.pylamaEnabled" = true;
  "python.linting.pylamaPath" = "${python3.pkgs.pylama}/bin/pylama";
  "python.linting.pylintPath" = "${python3.pkgs.pylint}/bin/pylint";
  "python.pythonPath" = "${python3}/bin/python3";
  "python.unitTest.pyTestEnabled" = false;
  "python.unitTest.pyTestPath" = "${python3.pkgs.pytest}/bin/pytest";
  "python.unitTest.unittestEnabled" = true;
  "maven.terminal.useJavaHome" = true;
  "metals.javaHome" = JAVA_HOME;
  "rust.rustfmt_path" = "${rustPlatform.rust}/bin/rustfmt";
  "rust-client.channel" = "nightly";
  "rust-client.disableRustup" = true;
  "rust-client.rlsPath" = "${rustPlatform.rust}/bin/rls";
  "sqlite.sqlite3" = "${sqlite}/bin/sqlite3";
  "tslint.packageManager" = "yarn";
  "tslint.validateWithDefaultConfig" = true;
}
