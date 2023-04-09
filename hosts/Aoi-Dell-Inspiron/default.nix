{inputs, pkgs, ...}: {
    imports = [
        ./hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.common-cpu-intel
        inputs.nixos-hardware.nixosModules.common-gpu-amd
        inputs.nixos-hardware.nixosModules.common-pc-ssd
        ../modules/minimal
        ../modules/laptop.nix
        ../modules/fonts.nix
        ../modules/security.nix
        ../modules/services.nix
        ../modules/sound.nix
    ];

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
            grub.useOSProber = true;
        };
        kernelPackages = pkgs.linuxPackages_latest;
    };
    networking.hostName = "Aoi-Dell-Inspiron";
}