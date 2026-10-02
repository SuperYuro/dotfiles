{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix/release-26.05";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      # inputs.nixpkgs.follows = "nixpkgs";
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

      mkHost =
        {
          name,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit nixpkgs-unstable; };
          modules = [
            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            impermanence.nixosModules.impermanence

            ./disko/${name}.nix
            ./system
            ./hosts/${name}
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.yuro = {
                imports = homeModules;
              };
            }
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        hinotori = mkHost {
          name = "hinotori";
          extraModules = [
            { nixpkgs.overlays = [ nix-claude-code.overlays.default ]; }
          ];
        };

        midori = mkHost { name = "midori"; };

        sakura = mkHost { name = "sakura"; };

        x260 = mkHost { name = "x260"; };
      };
    };
}
