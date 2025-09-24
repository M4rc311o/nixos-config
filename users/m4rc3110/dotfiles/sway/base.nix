{ pkgs, lib, ... }:
let
  colorScheme = {
    background = "#282A2E";
    backgroundAlt = "#373B41";
    foreground = "#C5C8C6";
    primary = "#F0C674";
    secondary = "#8ABEB7";
    alert = "#A54242";
    disabled = "#707880";
  };
  flameshotPkg = pkgs.flameshot.override { enableWlrSupport = true; };
in
{
   wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.wofi}/bin/wofi --show drun";
      fonts = {
	names = [ "FiraCode Nerd Font Mono" ];
	style = "Bold";
	size = 10.0;
      };
      gaps.inner = 3;
      window = {
      	border = 1;
	titlebar = false;
      };
      colors = {
        focused = {
	  border = colorScheme.backgroundAlt;
	  background = colorScheme.backgroundAlt;
	  text = colorScheme.primary;
	  indicator = colorScheme.backgroundAlt;
	  childBorder = colorScheme.primary;
	};
        unfocused = {
	  border = colorScheme.background;
	  background = colorScheme.background;
	  text = colorScheme.disabled;
	  indicator = colorScheme.background;
	  childBorder = colorScheme.background;
	};
        focusedInactive = {
	  border = colorScheme.background;
	  background = colorScheme.background;
	  text = colorScheme.secondary;
	  indicator = colorScheme.background;
	  childBorder = colorScheme.background;
	};
        urgent = {
	  border = colorScheme.background;
	  background = colorScheme.background;
	  text = colorScheme.alert;
	  indicator = colorScheme.background;
	  childBorder = colorScheme.background;
	};
      };
      floating.modifier = modifier;
      focus = {
        wrapping = "workspace";
	followMouse = "yes";
      };
      keybindings = lib.mkOptionDefault {
        "${modifier}+Shift+1" = "move container to workspace number 1, workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2, workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3, workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4, workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5, workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6, workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7, workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8, workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9, workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10, workspace number 10";

	"XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+";
	"XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%-";
	"XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle";
	"XF86AudioMicMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SOURCE@ toggle";

	"XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
	"XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
	"XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

	
	"XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +10%";
	"XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

	"${modifier}+Shift+d" = "sticky toggle";
	"${modifier}+l" = "exec ${pkgs.swaylock}/bin/swaylock";
	"${modifier}+Shift+Return" = "exec ${pkgs.alacritty}/bin/alacritty --command ${pkgs.tmux}/bin/tmux";

	"Print" = "exec ${flameshotPkg}/bin/flameshot screen";
	"Shift+Print" = "exec ${flameshotPkg}/bin/flameshot gui";
      };
      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];
      output = {
        "*" = {
	  bg = "${./background.png} fill";
	};
      };
      input = {
        "type:keyboard" = {
	  xkb_layout = "us,cz";
	  xkb_variant = ",ucw";
	  xkb_options = "grp:caps_switch";
	  repeat_delay = "350";
	  repeat_rate = "40";
	};
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  services.flameshot = {
    enable = true;
    package = flameshotPkg;
    settings = {
      General = {
	disabledTrayIcon = true;
	showStartupLaunchMessage = false;
	disabledGrimWarning = true;
      };
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 605;
        command = "${pkgs.sway}/bin/swaymsg 'output * power off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      color = "282828";
      hide-keyboard-layout = true;
      image = ./background.png;
    };
  };

  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";

      width = 400;
      height = 300;
      max-visible = 5;

      padding = 8;
      border-size = 3;
      border-radius = 10;

      background-color = "#282a2eE6";
      text-color = "#c5c8c6";
      border-color = "#373b41E6";

      markup = true;
      format = "<b>%s</b>\\n%b";
      icons = true;
      icon-location = "left";
      max-icon-size = 24;

      history = true;
      max-history = 20;

      "urgency=low" = {
        "background-color" = "#282a2eE6";
        "text-color" = "#c5c8c6";
        "border-color" = "#373b41E6";
        "default-timeout" = 4000;
      };

      "urgency=normal" = {
        "background-color" = "#282a2eE6";
        "text-color" = "#f0c674";
        "border-color" = "#373b41E6";
        "default-timeout" = 6000;
      };

      "urgency=critical" = {
        "background-color" = "#282a2eE6";
        "text-color" = "#a54242";
        "border-color" = "#a54242E6";
        "default-timeout" = 0;
      };
    };
  };
}
