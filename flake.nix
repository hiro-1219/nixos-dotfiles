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
    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Others
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    colorscheme = (import ./colorschemes) "tokyonight-moon";
  in {
    nixosConfigurations = {
      Aoi-Dell-Inspiron = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/Aoi-Dell-Inspiron];
      };
    };
    homeConfigurations = {
      "home@Aoi-Dell-Inspiron" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = [(import inputs.rust-overlay)];
        };
        extraSpecialArgs = {inherit inputs colorscheme;};
        modules = [./home/Aoi-Dell-Inspiron.nix];
      };
    };
    formatter."x86_64-linux" = (import nixpkgs {system = "x86_64-linux";}).alejandra;
  };  
}

