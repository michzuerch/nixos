{ config, pkgs, lib, ... }: {
  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "checkin" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}
