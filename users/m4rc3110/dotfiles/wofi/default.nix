{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    style = builtins.readFile ./gruvbox.css;
    settings = {
      term = "${pkgs.alacritty}/bin/alacritty";
      key_up = "Ctrl-p";
      key_down = "Ctrl-n";
    };
  };
}
