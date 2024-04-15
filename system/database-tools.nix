{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dbeaver
    mongodb-compass
    mongodb-tools
    mongosh
    redli
    robo3t
    sqlboiler
    sqlboiler-crdb
  ];
}
