{ pkgs, lib, ... }:
let
  modules = import ./modules.nix { inherit pkgs; };
in
{
  programs.waybar = {
    settings = {
      mainBar = {
        output = "eDP-1";
        modules-right = lib.mkBefore [
          "backlight"
          "battery"
          "bluetooth"
        ];

        "battery" = modules.battery;
        "backlight" = modules.backlight;
        "bluetooth" = modules.bluetooth;
      };
      sideBar = {
        output = "!eDP-1";
      };
    };
  };
}
