{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/common.nix
    ../../modules/desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.tmp.cleanOnBoot = true;

  # Is powered by battery?
  services.tlp.enable = true;

  hardware.graphics.enable = true;

  # Has bluetooth?
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.hostName = "zircon";
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
  system.stateVersion = "25.05"; # Did you read the comment?
}
