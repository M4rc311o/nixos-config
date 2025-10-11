{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.tmp.cleanOnBoot = true;

  boot.supportedFilesystems = ["zfs"];
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = ["fastpool" "slowpool"];
  networking.hostId = "4a2c3ab0";

  networking.hostName = "spinel";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  services = {
    openssh = {
      enable = true;
      #settings = {
      #  PasswordAuthentication = false;
      #  PermitRootLogin = "no";
      #};
    };
  };

  # FUTURE: Once *vivid* is available in *home-manager* move to *zsh* configuration
  # https://github.com/nix-community/home-manager/issues/7589
  programs.vivid = {
    enable = true;
    theme = "gruvbox-dark-hard";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
