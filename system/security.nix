{pkgs, ...}: {
  services.clamav.scanner = {
    enable = true;
    interval = "Sat *-*-* 04:00:00";
  };
  environment.systemPackages = with pkgs; [
    vulnix #scan command: vulnix --system
    #clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit #scan command: sudo chkrootkit
  ];
}
