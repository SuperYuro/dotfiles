{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # impermanence = {
    #   url = "github:nix-community/impermanence";
    # };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      disko,
      # impermanence,
      home-manager,
      catppuccin,
      nixvim,
      ...
    }:
    let
      homeModules = [
        nixvim.homeModules.nixvim
        catppuccin.homeModules.catppuccin
        ./home
        ./nixvim
      ];
    in
    {
      nixosConfigurations = {
        magenta = nixpkgs.lib.nixosSystem {
          modules = [
            disko.nixosModules.disko
            # impermanence.nixosModules.impermanence
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager

            ./disko/magenta.nix
            ./system
            ./hosts/magenta
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.yuro = {
                imports = homeModules;
              };
            }
          ];
        };

        midori = nixpkgs.lib.nixosSystem {
          modules = [
            disko.nixosModules.disko
            # impermanence.nixosModules.impermanence
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager

            ./disko/midori.nix
            ./system
            ./hosts/midori
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.yuro = {
                imports = homeModules;
              };
            }
          ];
        };
      };
    };
}
