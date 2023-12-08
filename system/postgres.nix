{ config, pkgs, lib, ... }: {
  services.postgresql = {
    enable = true;
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
