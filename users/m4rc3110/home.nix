{
  pkgs,
  lib,
  hostName,
  ...
}: let
  isDesktop = hostName == "dolomite" || hostName == "zircon";
  isServer = hostName == "spinel";
in {
  home = {
    username = "m4rc3110";
    homeDirectory = "/home/m4rc3110";
    stateVersion = "25.05";
    packages = with pkgs; [
      tldr
      zip
      unzip
      usbutils
    ];
  };

  imports =
    [
      ./dotfiles/git
      ./dotfiles/zsh
      ./dotfiles/tmux
      ./dotfiles/nvim
    ]
    ++ (lib.optionals isDesktop [./desktop.nix]);

  programs.home-manager.enable = true;
}
