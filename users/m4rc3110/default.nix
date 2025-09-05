{
  pkgs,
  ...
}:
{
  users = {
    users = {
      m4rc3110 = {
        shell = pkgs.zsh;
        uid = 1000;
        isNormalUser = true;
        group = "m4rc3110";
        extraGroups = [
          "wheel"
          "users"
          "networkmanager"
        ];
      };
    };
    groups = {
      m4rc3110 = {
        gid = 1000;
      };
    };
  };
  programs.zsh.enable = true;
}
