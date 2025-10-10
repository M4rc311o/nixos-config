{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      sway = {
        default = ["wlr" "gtk"];
        "org.freedesktop.impl.portal.Inhibit" = ["none"];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
