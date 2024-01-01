{ config, pkgs, lib, ... }: {
  services.cockroachdb = {
    enable = true;
    insecure = true;
    package = pkgs.cockroachdb;
  };

  # environment.systemPackages = with pkgs; [ cockroachdb ];
}
