{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/common.nix
    ../../modules/desktop.nix
  ];

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.tmp.cleanOnBoot = true;

  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.hostName = "dolomite";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    gparted
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05";
}
