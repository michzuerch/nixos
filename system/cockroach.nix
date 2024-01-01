{ config, pkgs, lib, ... }: {
  services.cockroachdb = {
    enable = true;
    package - pkgs.cockroachdb;
    settings = {
    };
  };

  # environment.systemPackages = with pkgs; [ cockroachdb ];
}
