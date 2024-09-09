{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    metasploit
    lynis
    nikto
    sqlmap
    shellcheck
    nmap
    wireshark
    john
    hashcat
    gobuster
    ghidra-bin # Binaries reverse
    gdb # Binaries debug
    bless # Hex reader ? hexedit
    burpsuite
    rustscan # Better nmap
    python3Packages.binwalk # Image debug
    foremost # File recovery
    tcpdump
    pngcheck
    dirb
  ];
}
