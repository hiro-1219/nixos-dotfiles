{
  description = "NixOS & home-manager flake";
  inputs = {
    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # rust-overlay
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
  in {
    nixosConfigurations = {
      Aoi-Dell-Inspiron = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/Aoi-Dell-Inspiron];
      };
    };
    homeConfigurations = {
      "hiroki@Aoi-Dell-Inspiron" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = [(import inputs.rust-overlay)];
        };
        modules = [./home/Aoi-Dell-Inspiron.nix];
      };
    };
    formatter."x86_64-linux" = (import nixpkgs {system = "x86_64-linux";}).alejandra;
  };  
}

