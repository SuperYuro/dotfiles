{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    nix-claude-code = {
      url = "github:ryoppippi/nix-claude-code";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      catppuccin,
      nixvim,
      nix-claude-code,
      disko,
      impermanence,
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
          specialArgs = { inherit nixpkgs-unstable; };
          modules = [
            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            impermanence.nixosModules.impermanence

            ./disko/magenta.nix
            ./system
            ./hosts/magenta
            {
              nixpkgs.overlays = [ nix-claude-code.overlays.default ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.yuro = {
                imports = homeModules;
              };
            }
          ];
        };

        midori = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit nixpkgs-unstable; };
          modules = [
            disko.nixosModules.disko
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
