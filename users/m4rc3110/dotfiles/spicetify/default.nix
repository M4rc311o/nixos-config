{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    wayland = true;
    theme = {
      name = "Gruvify";
      src = inputs.gruvify;
      extraPkgs = [ pkgs.dart-sass ];
      extraCommands = ''
        ${pkgs.dart-sass}/bin/sass ./Themes/Gruvify/user.sass ./Themes/Gruvify/user.css
      '';
    };
    colorScheme = "Gruvbox";
  };
}
