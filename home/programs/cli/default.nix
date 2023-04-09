{pkgs, ...}: {
    imports = [
        
    ];
    home.packages = with pkgs; [
        python3
        gcc
        bat
    ];
}