{pkgs, ...}: {
  services = {
    syncthing = {
      enable = true;
      user = "michzuerch";
      dataDir = "/home/michzuerch/Documents"; # Default folder for new synced folders
      configDir = "/home/michzuerch/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
