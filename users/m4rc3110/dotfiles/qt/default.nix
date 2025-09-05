{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gruvbox-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style = {
      name = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Gruvbox-Dark-Brown
    '';
    "Kvantum/Gruvbox-Dark-Brown".source = "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-Brown";
  };

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kvantum";
    #QT_QPA_PLATFORMTHEME = “qt5ct”;
  };
}
