{ config, pkgs, lib, ... }: {
  config.services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql_jit;
      ensureDatabases = [ "checkin" ];
      authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      '';
      # identMap = ''
      # # ArbitraryMapName systemUser DBUser
      #   superuser_map      root      postgres
      #   superuser_map      michzuerch  postgres
      #   superuser_map      postgres  postgres
      #   # Let other names login as themselves
      #   superuser_map      /^(.*)$   \1
      # '';
      # initialScript = pkgs.writeText "backend-initScript" ''
      #   CREATE ROLE checkin WITH LOGIN PASSWORD 'checkin' CREATEDB;
      #   CREATE DATABASE checkin;
      #   GRANT ALL PRIVILEGES ON DATABASE checkin TO checkinn;
      # '';
    };
    postgresqlBackup.enable = true;
  };
}
