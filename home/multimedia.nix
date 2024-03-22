{ pkgs, ... }: {
  home.packages = with pkgs; [
    # digikam
    # ffmpeg-full
    handbrake
    kodi-wayland
    libsForQt5.kdenlive
    losslesscut-bin
    mediathekview
    mpv
    openshot-qt
    vlc
    yt-dlp
    tartube-yt-dlp
  ];
}
