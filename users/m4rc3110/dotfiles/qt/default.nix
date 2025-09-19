{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   qt6Packages.qtstyleplugin-kvantum
  #   libsForQt5.qtstyleplugin-kvantum
  #   gruvbox-kvantum
  # ];
  #
  # qt = {
  #   enable = true;
  #   platformTheme.name = "kde";
  #   style = {
  #     name = "kvantum";
  #      package = pkgs.qt6Packages.qtstyleplugin-kvantum;
  #   };
  # };
  #
  # xdg.configFile = {
  #   "Kvantum/kvantum.kvconfig".text = ''
  #     [General]
  #     theme=Gruvbox-Dark-Brown
  #     use_theme_colors=true
  #   '';
  #   "Kvantum/Gruvbox-Dark-Brown".source = "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-Brown";
  #   "kdeglobals".text = ''
  #     [General]
  #     widgetStyle=kvantum
  #   '';
  # };
  #
  # home.sessionVariables = {
  #   QT_STYLE_OVERRIDE = "kvantum";
  #   QT_QPA_PLATFORMTHEME = "kde";
  # };
}
