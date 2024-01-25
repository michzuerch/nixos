{ pkgs, ... }: {
  services.redis.servers."ThinkpadNomad" = {
    enable = true;
    package = pkgs.redis;
    user = "michzuerch";
    port = 6379;
  };
}
