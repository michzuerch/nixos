{pkgs, ...}: {
  services.cockroachdb = {
    enable = true;
    insecure = true;
    join = "localhost:26257";
    package = pkgs.cockroachdb-bin;
  };
}
