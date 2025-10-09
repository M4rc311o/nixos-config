{
  inputs,
  hostName,
  ...
}: {
  nvim = {
    enable = true;
    packageNames = ["nvim"];
    packageDefinitions.replace = {
      nvim = {...}: {
        extra = {
          nixdExtras = {
            nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.${hostName}.options'';
            home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.${hostName}.options.home-manager.users.type.getSubOptions []'';
          };
        };
      };
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
