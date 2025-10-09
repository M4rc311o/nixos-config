{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_material_hard_dark";
    settings = {
      scrolling.history = 100000;
      font.normal = {family = "FiraCode Nerd Font Mono";};
      keyboard.bindings = [
        {
          key = "T";
          mods = "Control";
          chars = "${pkgs.tmux}/bin/tmux\n";
        }
      ];
    };
  };
}
