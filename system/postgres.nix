{ config, pkgs, lib, ... }: {
  services.postgresql = {
    enable = true;
    settings = {
      log_connections = true;
      log_statement = "all";
      logging_collector = true;
      log_disconnections = true;
      log_destination = lib.mkForce "syslog";
    };
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE michzuerch WITH LOGIN PASSWORD 'lx0lc33a' CREATEDB;
      CREATE DATABASE anouman;
      GRANT ALL PRIVILEGES ON DATABASE anouman TO michzuerch;
    '';
    # package = pkgs.postgresql;
    # ensureDatabases = [ "mydatabase" ];
    # ensureUsers = [
    #   { name = "michzuerch";
    #     ensurePermissions."DATABASE mydatabase" = "ALL PRIVILEGES";
    #   }
    # ];
    # enableTCPIP = true;
  };

  environment.systemPackages = with pkgs; [ dbeaver ];
}
