{
  pkgs,
  myLib,
  ...
}: let
  tex = (
    pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-medium
        circuitikz
        ;
    }
  );

  obsdian = myLib.wrapElectron {pkg = pkgs.obsidian;};
  signal-desktop = myLib.wrapElectron {pkg = pkgs.signal-desktop;};
in {
  home = {
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
        # signal-desktop
        kdePackages.okular
        pavucontrol
        nmap
        ghidra
        chromium
        inkscape
        # obsidian # FUTURE: Check obsdian HM settings
        darktable
      ])
      ++ [tex]
      ++ [
        obsdian
        signal-desktop
      ];
  };

  imports = [
    ./dotfiles/xdg
    ./dotfiles/sway
    ./dotfiles/gtk
    ./dotfiles/qt
    ./dotfiles/alacritty
    ./dotfiles/wofi
    ./dotfiles/waybar
    ./dotfiles/spicetify
    ./dotfiles/firefox
    ./dotfiles/vesktop
    ./dotfiles/zathura
    ./dotfiles/obs
  ];

  services.playerctld.enable = true;
  services.udiskie.enable = true;
}
