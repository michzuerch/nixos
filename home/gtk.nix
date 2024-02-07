{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      # package = pkgs.gnome.adwaita-icon-theme;
      package = pkgs.quintom-cursor-theme;
      # name = "Adwaita";
      name = "Quintom_Snow"; #Quintom_Ink
      size = 36;
    };
    iconTheme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita-dark";
    };
    theme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita-dark";
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
