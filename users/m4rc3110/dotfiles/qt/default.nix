{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # libsForQt5.qt5ct
    # kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    gruvbox-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    # style = {
    #   name = "kvantum-dark";
    # };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
      General = {
        theme = "Gruvbox-Dark-Brown";
      };
    };
    "Kvantum/Gruvbox-Dark-Brown".source = "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-Brown";
    "kdeglobals".source = ./kdeglobals;
    "qt5ct/qt5ct.conf".source = pkgs.replaceVars ./qt5ct/qt5ct.conf {
      color_scheme_path = ./qt5ct/style-colors.conf;
    };
    "qt5ct/style-colors.conf".source = ./qt5ct/style-colors.conf;
    "qt6ct/qt6ct.conf".source = pkgs.replaceVars ./qt6ct/qt6ct.conf {
      color_scheme_path = ./qt6ct/style-colors.conf;
    };
    "qt6ct/style-colors.conf".source = ./qt6ct/style-colors.conf;
  };

  xdg.dataFile = {
    "color-schemes/DarkPastels.colors".source = ./DarkPastels.colors;
  };

  home.sessionVariables = lib.mkForce {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # QT_STYLE_OVERRIDE = "kvantum-dark";
  };
}
