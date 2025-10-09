{pkgs, ...}: {
  swayMode = {
    tooltip = false;
  };
  clock = {
    format = "{:%H:%M}";
    format-alt = "{:%a %d/%m/%Y %H:%M}";
    tooltip-format = "{:%Y-%m-%d %H:%M:%S %Z}";
  };
  mpris = {
    format = "{player_icon} {status_icon} {title} | {artist}";
    title-len = 50;
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
    # on-click = "${pkgs.pulseuadio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
    on-click = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
  };
  network = {
    interval = 5;
    format-ethernet = "󰈀 {ifname}";
    format-wifi = " {essid}";
    format-linked = "󰌘 No IP";
    format-disconnected = "󱘖 Disconnected";
    format-alt = "{ifname} ({ipaddr})";
    tooltip-format = ''
      {ifname}
      IP: {ipaddr}
      Mask: {netmask} ({cidr})
      GW: {gwaddr}'';
  };
  battery = {
    states = {
      warning = 20;
      critical = 5;
    };
    format = "{icon} {capacity}%";
    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    format-charging = "󰢟 {capacity}%";
  };
  backlight = {
    format = "{icon} {percent}%";
    format-icons = ["󰃞" "󰃟" "󰃠"];
    tooltip = false;
  };
  bluetooth = {
    format = " {status}";
    format-disabled = "";
    format-connected = " {device_alias}";
    format-connected-battery = " {device_alias} {device_battery_percentage}%";
  };
}
