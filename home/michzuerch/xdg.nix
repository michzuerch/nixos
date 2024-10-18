{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg.configFile."mimeapps.list".force = true;
  xdg = {
    enable = true;
    mime.enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    # manage $XDG_CONFIG_HOME/mimeapps.list
    # xdg search all desktop entries from $XDG_DATA_DIRS, check it by command:
    #  echo $XDG_DATA_DIRS
    # the system-level desktop entries can be list by command:
    #   ls -l /run/current-system/sw/share/applications/
    # the user-level desktop entries can be list by command(user ryan):
    #  ls /etc/profiles/per-user/ryan/share/applications/
    mimeApps = {
      enable = true;

      associations.added = {
        "application/pdf" = ["org.gnome.Evince.desktop"];
        "image/*" = ["org.gnome.Loupe.desktop"];
        "video/*" = ["totem.desktop"];

        "text/html" = ["firefox.desktop"];
        "text/xml" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
      };

      defaultApplications = {
        "application/pdf" = ["org.gnome.Evince.desktop"];
        "image/*" = ["org.gnome.Loupe.desktop"];
        "video/*" = ["totem.desktop"];

        "text/html" = ["firefox.desktop"];
        "text/xml" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
