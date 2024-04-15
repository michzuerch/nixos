{pkgs, ...}: {
  home.sessionVariables = {
    PGHOST = "localhost";
    PGUSER = "michzuerch";
    PGPASSWORD = "lx0lc33a";
    PGPORT = 26257;
    PGDATABASE = "checkinboard";
    SCALE = 100;
  };
}
