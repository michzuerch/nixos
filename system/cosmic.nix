{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-osd
    cosmic-term
    cosmic-edit
    cosmit-comp
    cosmic-randr
    cosmic-panel
    cosmic-files
    cosmic-session
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-launcher
    cosmic-screenshot
    cosmic-applibrary
    cosmic-design-demo
  ];
}
