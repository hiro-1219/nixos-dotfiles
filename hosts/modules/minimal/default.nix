{pkgs, nixpkgs, ...}: {
    imports = [
        ./nix.nix
        ./services.nix
        ./virtualisation.nix
    ];

    # User environment
    users.users.hiroki = {
        isNormalUser = true;
        home = "/home/hiroki";
        shell = pkgs.fish;
        extraGroups = ["networkmanager" "wheel" "docker" ];
    };
    
    programs.fish.enable = true;
    environment = {
        shells = [pkgs.fish];
        systemPackages = with pkgs; [
            fish
            git
            emacs
        ];
    };
    console.keyMap = "jp106";

    # Window Manager
    services.printing.enable = true;
    services.xserver.libinput.enable = true;
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "modesetting" ];
    services.xserver.desktopManager.pantheon.enable = true;

    # network
    networking = {
        networkmanager.enable = true;
    };
    systemd.services.NetworkManager-wait-online.enable = false;

    # localize
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = with pkgs; [fcitx5-mozc];
    };

    # allow proprietary software
    nixpkgs.config.allowUnfree = true;

    system = {
        stateVersion = "22.11";
    };
}