{
  pkgs,
  lib,
}: {
  wrapElectron = import ./wrapElectron.nix {inherit pkgs lib;};
}
