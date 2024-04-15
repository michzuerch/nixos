{pkgs, ...}: {
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-6_0;
  };
}
