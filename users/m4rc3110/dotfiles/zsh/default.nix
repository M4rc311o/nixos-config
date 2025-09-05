{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    # defaultKeymap = "viins";
    history = {
      append = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      save = 999999;
      size = 999999;
    };
    completionInit = builtins.readFile ./compinstall;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#7c6f64";
    };
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = pkgs.zsh-vi-mode.pname;
        src = pkgs.zsh-vi-mode.src;
      }
      {
        name = pkgs.zsh-powerlevel10k.pname;
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-powerlevel10k-config";
        src = ./zsh-powerlevel10k-config;
        file = "p10k.zsh";
      }
      {
        name = "sudo";
        src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/sudo";
      }
    ];
    shellAliases = {
      ls    = "ls --color=auto";
      ll    = "ls -hlA";
      la    = "ls -hl";

      gits  = "git status";

      diff  = "diff --color=auto";
      ip    = "ip -color=auto";
      watch = "watch --color";
      grep  = "grep --color=auto";
    };
    initContent = lib.mkOrder 1500 ''
      init() {
        autoload -U history-search-end
	zle -N history-beginning-search-backward-end history-search-end
	zle -N history-beginning-search-forward-end history-search-end
	bindkey "^[[A" history-beginning-search-backward-end
	bindkey "^[[B" history-beginning-search-forward-end
      }

      function zvm_after_init() { init }
    '';
  };
}
