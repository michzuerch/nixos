{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dbeaver-bin
    mongodb-compass
    mongodb-tools
    mongosh
    redli
    robo3t
    sqlboiler
    sqlboiler-crdb
  ];
}
