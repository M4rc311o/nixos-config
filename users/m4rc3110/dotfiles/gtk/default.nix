{ pkgs, ... }:
let
  gruvboxThemePkg = pkgs.gruvbox-gtk-theme.override {
    iconVariants = [ "Dark" ];
  };
in
{
  gtk = {
    enable = true;
    # FUTURE: This atribute is not yet in current stable HM
    # Once it is available prefer this over current method
    #colorScheme = "dark";
    gtk3.extraConfig."gtk-application-prefer-dark-theme" = true;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = true;
    theme = {
      name = "Gruvbox-Dark";
      package = gruvboxThemePkg;
    };
    iconTheme = {
      name = "Gruvbox-Dark";
      package = gruvboxThemePkg;
    };
  };
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
