{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = ["checkin"];
    enableTCPIP = true;
    settings = {
      port = 5432;
    };
    authentication = pkgs.lib.mkOverride 10 ''
      # Generated file; do not edit!
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      CREATE DATABASE nixcloud;
      GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
    '';
  };
}
