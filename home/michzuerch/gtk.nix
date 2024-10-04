{ pkgs, ... }:
{
  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #     package = pkgs.flat-remix-gtk;
  #   };
  #   font = {
  #     name = "Ubuntu";
  #     size = 12;
  #     package = pkgs.ubuntu_font_family;
  #   };
  #   cursorTheme = {
  #     # package = pkgs.gnome.adwaita-icon-theme;
  #     package = pkgs.quintom-cursor-theme;
  #     # name = "Adwaita";
  #     name = "Quintom_Snow"; # Quintom_Ink
  #     size = 24;
  #   };
  #   iconTheme = {
  #     name = "Adwaita";
  #   };
  #   gtk3.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  #   gtk4.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  # };
  #
  # Sample from Github HeinzDev
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-magenta-dark";
      package = pkgs.yaru-theme;
    };

    theme = {
      name = "Tokyonight-Dark-B-LB";
      package = pkgs.tokyo-night-gtk;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
      # x11.enable = true;
    };

    packages = with pkgs; [
      adwaita-icon-theme
      libsForQt5.qt5ct
    ];

    sessionVariables = {
      XCURSOR_SIZE = "24";
    };
  };
}
