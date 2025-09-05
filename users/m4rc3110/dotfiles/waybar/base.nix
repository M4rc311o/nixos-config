{ lib, ... }:
let
  modules = import ./modules.nix;
in
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./gruvbox.css;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	modules-left = [
	  "sway/workspaces"
	  "sway/mode"
	  "tray"
	  "mpris"
	];
	modules-center = [
	  "clock"
	];
	modules-right = [
	  "disk"
	  "pulseaudio"
	  "memory"
	  "cpu"
	  "network"
	];

        "mpris" = modules.mpris;
	"memory" = modules.memory;
        "cpu" = modules.cpu;
        "disk" = modules.disk;
        "pulseaudio" = modules.pulseaudio;
	"network" = modules.network;
      };
      sideBar = {
        layer = "top";
	position = "top";
	output = lib.mkDefault [];
	modules-left = [
	  "sway/workspaces"
	  "sway/mode"
	];
	modules-right = [
	  "clock"
	];
      };
    };
  };
}
