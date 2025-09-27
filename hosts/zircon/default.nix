{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./disko.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.tmp.cleanOnBoot = true;

  services.tlp.enable = true;

  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.hostName = "zircon";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  nixpkgs.config.allowUnfree = true;

  security.polkit.enable = true;
  security.pam.services.swaylock = {};
  programs.dconf.enable = true;

  services.udisks2.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    gparted
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      sway = {
        default = [ "wlr" ];
      };
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    printing.enable = true;
  };

  # FUTURE: Once *vivid* is available in *home-manager* move to *zsh* configuration
  # https://github.com/nix-community/home-manager/issues/7589
  programs.vivid = {
      enable = true;
      theme = "gruvbox-dark-hard";
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.fira-code
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

