{pkgs, ...}: {
  networking.nameservers = [
    "9.9.9.9#dns.quad9.net"
  ];
}
