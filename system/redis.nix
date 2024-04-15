{pkgs, ...}: {
  services.redis.servers."ThinkpadNomad" = {
    enable = true;
    port = 6379;
  };
}
