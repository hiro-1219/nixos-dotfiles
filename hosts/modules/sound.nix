{
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
        pulse.enable = true;
    };
    programs.noisetorch.enable = true;
}