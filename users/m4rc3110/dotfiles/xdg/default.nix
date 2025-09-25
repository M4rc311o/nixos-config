{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nautilus
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "nautilus.desktop" ];
        "application/pdf" = [ "org.kde.okular.desktop" ];
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
      };
    };
  };
}
