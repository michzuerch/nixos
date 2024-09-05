{pkgs, ...}: {
  home = {
    file = {
      ".config/ranger/commands.py".source = ./ranger/commands.py;
      ".config/ranger/commands_full.py".source = ./ranger/commands_full.py;
      ".config/ranger/rc.conf".source = ./ranger/rc.conf;
      ".config/ranger/rifle.conf".source = ./ranger/rifle.conf;
      ".config/ranger/scope.sh".source = ./ranger/scope.sh;
      ".config/ranger/plugins/ranger_devicons/__init__.py".source =
        ./ranger/plugins/ranger_devicons/__init__.py;
      ".config/ranger/plugins/ranger_devicons/devicons.py".source =
        ./ranger/plugins/ranger_devicons/devicons.py;
    };
  };
}
