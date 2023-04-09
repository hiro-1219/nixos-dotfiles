{pkgs, ...}: {
    fonts = {
        fonts = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-extra
            noto-fonts-emoji
        ];
        fontconfig = {
            enable = true;
            defaultFonts = {
                sansSerif = [ "Noto Sans CJK JP" ];
                serif = [ "Noto Serif JP" ];
            };
            subpixel = { lcdfilter = "light"; };
        };
    };
}