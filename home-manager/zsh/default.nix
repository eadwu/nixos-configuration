{ pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = false;
  programs.zsh.history.size = 1000000000;
  programs.zsh.history.ignoreDups = true;
  programs.zsh.history.ignoreAllDups = false;
  programs.zsh.history.ignoreSpace = true;
  programs.zsh.history.expireDuplicatesFirst = false;
  programs.zsh.history.share = true;
  programs.zsh.history.extended = false;

  programs.zsh.plugins = [
    {
      name = "powerline10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }

    {
      name = "autosuggestions";
      src = pkgs.zsh-autosuggestions;
      file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    }

    {
      name = "fast-syntax-highlighting";
      src = pkgs.zsh-fast-syntax-highlighting;
      file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
    }

    {
      name = "powerline10k-config";
      src = ./.;
      file = "p10k.zsh";
    }
  ];

  programs.zsh.initExtra = ''
    GITSTATUS_LOG_LEVEL=DEBUG

    ZSH_AUTOSUGGEST_USE_ASYNC=1
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

    # [Up-Arrow] - fuzzy find history forward
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "$terminfo[kcuu1]" up-line-or-beginning-search

    # [Down-Arrow] - fuzzy find history backward
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "$terminfo[kcud1]" down-line-or-beginning-search
  '';
}
