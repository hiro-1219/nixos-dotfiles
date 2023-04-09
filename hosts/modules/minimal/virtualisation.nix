{pkgs, ...}: {
    # Docker
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
    };
    environment.systemPackages = with pkgs; [docker-compose];
    virtualisation.virtualbox.host = {
        enable = true;
        enableExtensionPack = true;
    };
    users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.x11 = true;
}