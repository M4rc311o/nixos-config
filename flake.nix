{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    gruvify = {
      url = "github:Skaytacium/Gruvify";
      flake = false;
    };
    nvim-nixcats = {
      url = "github:M4rc311o/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    disko,
    home-manager,
    spicetify-nix,
    nvim-nixcats,
    ...
  }: let
    inherit (nixpkgs) lib;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
    myLib = import ./lib {inherit lib pkgs;};
  in {
    nixosConfigurations.dolomite = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs myLib;};
      modules = [
        disko.nixosModules.disko
        ./hosts/dolomite
        ./users/m4rc3110
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.m4rc3110.imports = [
            spicetify-nix.homeManagerModules.default
            nvim-nixcats.homeModules.default
            ./users/m4rc3110/home.nix
          ];
          home-manager.extraSpecialArgs = {
            inherit inputs myLib;
            unstablePkgs = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            hostName = "dolomite";
          };
        }
      ];
    };
    nixosConfigurations.zircon = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs myLib;};
      modules = [
        disko.nixosModules.disko
        ./hosts/zircon
        ./users/m4rc3110
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.m4rc3110.imports = [
            spicetify-nix.homeManagerModules.default
            nvim-nixcats.homeModules.default
            ./users/m4rc3110/home.nix
          ];
          home-manager.extraSpecialArgs = {
            inherit inputs myLib;
            unstablePkgs = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            hostName = "zircon";
          };
        }
      ];
    };
    nixosConfigurations.spinel = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs myLib;};
      modules = [
        disko.nixosModules.disko
        ./hosts/spinel
        ./users/m4rc3110
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.m4rc3110.imports = [
            spicetify-nix.homeManagerModules.default
            nvim-nixcats.homeModules.default
            ./users/m4rc3110/home.nix
          ];
          home-manager.extraSpecialArgs = {
            inherit inputs myLib;
            unstablePkgs = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            hostName = "spinel";
          };
        }
      ];
    };
  };
}
