{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    historyLimit = 999999;
    keyMode = "vi";
    mouse = true;
    terminal = "$TERM";
    prefix = "C-Space";
    extraConfig = ''
      set-option -ga terminal-overrides ",alacritty:Tc"
      set -g renumber-windows on
      bind X kill-pane

      # Set new panes to open in current directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      setw -g clock-mode-colour yellow

      # copy mode
      setw -g mode-style 'fg=black bg=red bold'

      # panes
      set -g pane-border-style 'fg=red'
      set -g pane-active-border-style 'fg=yellow'

      # statusbar
      set -g status-position top
      set -g status-justify centre
      set -g status-style 'fg=red'

      set -g status-left ""
      set -g status-right ""

      setw -g window-status-current-style 'fg=black bg=yellow'
      setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=red bg=black'
      setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '
    '';
  };
}
