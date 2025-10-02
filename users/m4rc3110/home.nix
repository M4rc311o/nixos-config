{ pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium
        circuitikz
        ;
    }
  );
in
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
    packages =
      (with pkgs; [
        wireshark
        prusa-slicer
        signal-desktop
        kdePackages.okular
        pavucontrol
        nmap
        tldr
        ghidra
        zip
        unzip
        chromium
        inkscape
      ])
      ++ [ tex ];
  };

  imports = [
    ./dotfiles/xdg
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
    ./dotfiles/zathura
  ];

  services.playerctld.enable = true;
  services.udiskie.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.home-manager.enable = true;
}
