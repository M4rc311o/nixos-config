{ pkgs, ... }:
{
  home = {
    username = "m4rc3110";
    homeDirectory = "/home/m4rc3110";
    stateVersion = "25.05";
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
    };
    packages = with pkgs; [
      wireshark
      prusa-slicer
    ];
  };

  imports = [
    ./dotfiles/git
    ./dotfiles/nvim
    ./dotfiles/sway
    ./dotfiles/gtk
    ./dotfiles/qt
    ./dotfiles/zsh
    ./dotfiles/tmux
    ./dotfiles/alacritty
    ./dotfiles/wofi
    ./dotfiles/waybar
    ./dotfiles/spicetify
    ./dotfiles/firefox
    ./dotfiles/vesktop
  ];

  services.playerctld.enable = true;
  
  programs.home-manager.enable = true;
}
