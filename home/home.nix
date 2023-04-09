
{
    home = rec {
        username = "hiroki";
        homeDirectory = "/home/${username}";
        stateVersion = "22.11";
    };

    programs.home-manager.enable = true;
}