{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    macchina
    cpufetch
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
