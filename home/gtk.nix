{ pkgs, ... }: {
  gtk = {
    enable = true;
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
      size = 36;
    };
    theme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita-dark";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 36;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_SIZE = "36";
  };
}
