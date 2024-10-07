# V_: {
#   # Enable Bluetooth
#   hardware.bluetooth.enable = true;
#   hardware.bluetooth.powerOnBoot = false;
#   services.blueman.enable = true;
# }
#
{pkgs, ...}: {
  # persist.dir = [
  #   "/var/lib/bluetooth"
  # ];
  environment.systemPackages = with pkgs; [bluez];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # https://github.com/NixOS/nixpkgs/issues/114222
  systemd.user.services.telephony_client.enable = false;
}
