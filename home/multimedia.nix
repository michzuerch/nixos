{pkgs, ...}: {
  home.packages = with pkgs; [
    digikam
    jellyfin-ffmpeg
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
