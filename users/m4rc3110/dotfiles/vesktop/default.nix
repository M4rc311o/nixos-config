{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      hardwareAcceleration = true;
      minimizeToTray = false;
      arRPC = true;
    };
    vencord = {
      settings = {
        autoUpdate = false;
      };
    };
  };
}
