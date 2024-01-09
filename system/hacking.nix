{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [ 
    aircrack-ng
    bettercap
    burpsuite
    hash-identifiert
    hashcat
    hashcat-utils
    hping
    kismet
    macchanger
    metasploit
    nmap
    snort
    wavemon
    wifite2
    wireguard-tools
    wireshark
  ];
}
