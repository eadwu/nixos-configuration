{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    history.size = 1000000000;
    history.ignoreDups = true;
    history.ignoreAllDups = false;
    history.ignoreSpace = true;
    history.expireDuplicatesFirst = false;
    history.share = false;
    history.extended = false;

    plugins = [
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

    initExtra = ''
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
  };
}
