{ pkgs, ... }:
{
    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-3d-effect
            obs-advanced-masks
            obs-composite-blur
            droidcam-obs
            obs-move-transition
            advanced-scene-switcher
            obs-shaderfilter
            obs-source-clone
            # obs-stroke-glow-shadow # FUTURE: Available currently only in unstable
        ];
    };
}
