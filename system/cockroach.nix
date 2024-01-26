{ pkgs, ... }: {
  services.cockroachdb = {
    enable = true;
    insecure = true;
    package = pkgs.cockroachdb;
  };
}
