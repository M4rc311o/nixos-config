{
  mpris = {
    format = "{player_icon} {status_icon} {title} | {artist}";
    status-icons = {
      playing = "󰐊";
      paused = "󰏤";
      stopped = "󰓛";
    };
    player-icons = {
      "spotify" = "";
      "firefox" = "󰈹";
      default = "󰎇";
    };
  };
  memory = {
    interval = 10;
    format = " {percentage}%";
    states = {
      warning = 85;
      critical = 95;
    };
  };
  cpu = {
    interval = 10;
    format = "  {usage}%";
    states = {
      warning = 85;
      critical = 95;
    };
  };
  disk = {
    interval = 600;
    format = "󰋊 {percentage_used}%";
    path = "/";
    states = {
      warning = 85;
      critical = 95;
    };
  };
  pulseaudio = {
    scroll-step = 5;
    format = "{icon} {volume}%";
    format-muted = "󰖁 Muted";
    format-icons = {
      headphone = " ";
      hands-free = " ";
      headset = " ";
      phone = " ";
      portable = " ";
      car = " ";
      hdmi = " ";
      default = [" " " " " "];
    };
  };
  network = {
    interval = 5;
    format-ethernet = "󰈀 {ifname}";
    format-wifi = " {essid}";
    format-linked = "󰌘 No IP";
    format-disconnected = "󱘖 Disconnected";
    format-alt = "{ifname} ({ipaddr})";
  };
  battery = {
    states = {
      warning = 20;
      critical = 5;
    };
    format = "{icon} {capacity}%";
    format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    format-charging = "󰢟 {capacity}%";
  };
  backlight = {
    format = "{icon} {percent}%";
    format-icons = [ "󰃞" "󰃟" "󰃠" ];
  };
  bluetooth = {
    format = " {status}";
    format-disabled = "";
    format-connected = " {device_alias}";
    format-connected-battery = " {device_alias} {device_battery_percentage}%";
  };
}
