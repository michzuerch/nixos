{ pkgs, ... }: {
  services.redis.servers."ThinkpadNomad" = {
    enable = true;
    user = "michzuerch";
    port = 6379;
  };
  environment.systemPackages = with pkgs; [
    redit
  ];
}
