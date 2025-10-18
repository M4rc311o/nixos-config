{
  pkgs,
  myLib,
  ...
}: {
  programs.vesktop = {
    enable = true;
    package = myLib.wrapElectron {pkg = pkgs.vesktop;};
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
