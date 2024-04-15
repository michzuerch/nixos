{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetch
    onefetch
    # ipfetch
    cpufetch
    # starfetch
    octofetch
    htop
    gtop
    kmon
    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    # nvtop
    dig
    speedtest-rs
  ];
}
