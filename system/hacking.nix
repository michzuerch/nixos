{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    # aircrack-ng
    # airgeddon
    # bettercap
    burpsuite
    # hash-identifier
    # hashcat
    # hashcat-utils
    # hping
    # john
    # johnny
    # kismet
    # macchanger
    # metasploit
    # nmap
    # snort
    # wavemon
    # wifite2
    # wireguard-tools
    wireshark
  ];
}
