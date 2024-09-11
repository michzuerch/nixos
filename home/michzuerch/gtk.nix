{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "adwaita-dark";
      package = pkgs.adw-gtk3;
    };
    font = {
      name = "Ubuntu";
      size = 12;
      package = pkgs.ubuntu_font_family;
    };
    cursorTheme = {
      # package = pkgs.gnome.adwaita-icon-theme;
      package = pkgs.quintom-cursor-theme;
      # name = "Adwaita";
      name = "Quintom_Snow"; #Quintom_Ink
      size = 24;
    };
    iconTheme = {
      name = "elementary-Xfce-dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_SIZE = "24";
  };
}
