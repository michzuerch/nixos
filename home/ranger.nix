{pkgs, ...}: {
  home.file.".config/ranger/commands.py".source = ./ranger/commands.py;
  home.file.".config/ranger/commands_full.py".source = ./ranger/commands_full.py;
  home.file.".config/ranger/rc.conf".source = ./ranger/rc.conf;
  home.file.".config/ranger/rifle.conf".source = ./ranger/rifle.conf;
  home.file.".config/ranger/scope.sh".source = ./ranger/scope.sh;
  home.file.".config/ranger/plugins/ranger_devicons/__init__.py".source = ./ranger/plugins/ranger_devicons/__init__.py;
  home.file.".config/ranger/plugins/ranger_devicons/devicons.py".source = ./ranger/plugins/ranger_devicons/devicons.py;
}
