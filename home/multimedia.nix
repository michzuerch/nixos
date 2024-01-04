{ pkgs, ... }: {
  home.packages = with pkgs; [
    digikam
    ffmpeg_6-full
    handbrake
    kodi-wayland
    libsForQt5.kdenlive
    losslesscut-bin
    mpv
    openshot-qt
    vlc
    yt-dlp
  ];
}
