# {
#   pkgs,
#   lib,
#   ...
# }: let
#   inferBin = pkg:
#     if pkg ? meta && pkg.meta ? mainProgram
#     then pkg.meta.mainProgram
#     else if pkg ? pname
#     then pkg.pname
#     else null;
# in
#   {
#     pkg,
#     bin ? inferBin pkg,
#   }:
#     assert bin != null;
#       pkgs.symlinkJoin {
#         name = pkg.pname;
#         paths = [pkg];
#         buildInputs = [pkgs.makeWrapper];
#         postBuild = lib.strings.concatStrings [
#           "wrapProgram $out/bin/"
#           bin
#           " --add-flags \"--disable-gpu-compositing\""
#         ];
#       }
{
  pkgs,
  lib,
  ...
}: let
  inferBin = pkg:
    if pkg ? meta && pkg.meta ? mainProgram
    then pkg.meta.mainProgram
    else if pkg ? pname
    then pkg.pname
    else null;

  wrapOne = {
    pkg,
    bin ? inferBin pkg,
  }:
    assert bin != null; let
      wrapped = pkgs.symlinkJoin {
        # keep the same name so consumers don’t get surprised
        name = pkg.pname;
        paths = [pkg];
        buildInputs = [pkgs.makeWrapper];
        postBuild = ''
          wrapProgram "$out/bin/${bin}" --add-flags "--disable-gpu-compositing"
        '';
      };
    in
      # preserve overridability by forwarding override/overrideAttrs
      wrapped
      // {
        override = args: let
          base' =
            if pkg ? override
            then pkg.override args
            else pkg; # fallback: ignore args if not overridable
        in
          wrapOne {pkg = base';}; # re-infer bin

        overrideAttrs = f: let
          base' =
            if pkg ? overrideAttrs
            then pkg.overrideAttrs f
            else pkg;
        in
          wrapOne {pkg = base';};
      };
in
  wrapOne
