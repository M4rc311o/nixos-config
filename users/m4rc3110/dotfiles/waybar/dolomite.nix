{ lib, ... }:
let
  modules = import ./modules.nix;
in
{
  programs.waybar = {
    settings = {
      mainBar = {
        output = "HDMI-A-1";
        modules-right = lib.mkBefore [
          "bluetooth"
        ];

        "bluetooth" = modules.bluetooth;
      };
      sideBar = {
        output = "!HDMI-A-1";
      };
    };
  };
}
