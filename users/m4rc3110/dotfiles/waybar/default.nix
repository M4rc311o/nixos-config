{
  lib,
  hostName,
  ...
}: let
  hostFile = ./. + "/${hostName}.nix";
in {
  imports = [./base.nix] ++ lib.optional (builtins.pathExists hostFile) hostFile;
}
