{
  wayland.windowManager.sway = {
    extraOptions = [ "--unsupported-gpu" ];
    config = {
      output = {
        "HDMI-A-1" = {
          mode = "1920x1080";
          position = "1050 0";
          transform = "normal";
        };
        "DP-3" = {
          mode = "1920x1080";
          position = "2970 0";
          transform = "normal";
        };
        "DP-1" = {
          mode = "1680x1050";
          position = "0 0";
          transform = "270";
        };
      };
      workspaceOutputAssign = [
        { workspace = "1"; output = "HDMI-A-1"; }
        { workspace = "2"; output = "HDMI-A-1"; }
        { workspace = "3"; output = "HDMI-A-1"; }
        { workspace = "4"; output = "DP-3"; }
        { workspace = "5"; output = "DP-3"; }
        { workspace = "6"; output = "DP-3"; }
        { workspace = "7"; output = "DP-1"; }
        { workspace = "8"; output = "DP-1"; }
        { workspace = "9"; output = "DP-1"; }
      ];
    };
  };
}
