{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    loupe
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["nautilus.desktop"];

        "application/pdf" = ["org.pwmt.zathura.desktop"];

        "text/html" = ["firefox.desktop"];

        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];

        "image/jpeg" = ["org.gnome.Loupe.desktop"];
        "image/png" = ["org.gnome.Loupe.desktop"];
      };
    };
  };
}
