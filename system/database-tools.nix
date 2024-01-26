{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    dbeaver
    mongodb_compass
    mongodb-tools
    mongosh
    redli
    robo3t
  ];
}
