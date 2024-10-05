{ lib, config, myLib, ... }:

let cfg = config.my.security;
in {
  imports = [
    ./login
    ./apparmor.nix
    ./auditd.nix
    ./clamav.nix
    ./pam.nix
    ./polkit.nix
    ./selinux.nix
    ./sudo.nix
    ./tor.nix
  ];

  options.my.security = {
    noMitigations = lib.mkEnableOption "Disable all CPU mitigations.";
  };

  config = {
    security = {
      protectKernelImage = true;
      lockKernelModules = false; # Breaks virtd, wireguard and iptables
      virtualisation.flushL1DataCache = "always";
      forcePageTableIsolation = true; # Page Table Isolation (PTI)
      allowUserNamespaces = true; # User namespaces are required for sandboxing.
      # Disable unprivileged user namespaces, unless containers are enabled
      unprivilegedUsernsClone = config.virtualisation.containers.enable;
      allowSimultaneousMultithreading = true;
    };

    # You can find out whats recommended for you, by following these steps
    # sudo sysctl -a > sysctl.txt
    # kernel-hardening-checker -l /proc/cmdline -c /proc/config.gz -s ./sysctl.txt
    boot = {
      # # https://docs.kernel.org/admin-guide/sysctl/vm.html </> https://sysctl-explorer.net/
      # kernel.sysctl = lib.mkIf (!(myLib.isSubsystem config)) {
      #   "kernel.sysrq" = 0; # Allows users connected to the kernel console
      #   "kernel.yama.ptrace_scope" = 3; # Restrict ptrace() pre-defined rship
      #   "kernel.kptr_restrict" = 2; # Hide kptrs
      #   "net.core.bpf_jit_enable" = false; # Eliminate spray attacks
      #   "kernel.ftrace_enabled" = false; # # Disable ftrace debugging
      #   "kernel.dmesg_restrict" = 1; # # Avoid kernel memory address exposures
      #   "fs.protected_fifos" = 2; # Prevent unintentional fifo writes
      #   "fs.protected_regular" = 2; # Prevent unintended writes to existed
      #   "fs.suid_dumpable" = 0; # Disable SUID binary dump
      #   "kernel.perf_event_paranoid" = 3; # Disallow profiling at all levels
      #   "kernel.unprivileged_bpf_disabled" = true; # Require CAP_BPF to use bpf
      #   "kernel.printk" = "3 3 3 3"; # Prevent boot console log leaking info
      #   "dev.tty.ldisc_autoload" = 0; # prevent from loading disaciplines
      #   "dev.tty.legacy_tiocsti" = 0; # Disable TIOCSTI ioctl
      #   # Prevent unprivileged users from creating hard or symbolic links to files
      #   "fs.protected_symlinks" = 1;
      #   "fs.protected_hardlinks" = 1;
      # };

      # # https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
      # kernelParams = if cfg.noMitigations then [
      #   "l1tf=off" # for L1TF (CVE-2018-3620 and CVE-2018-3646).
      #   "mds=off" # (CVE-2018-12126, CVE-2018-12127, CVE-2018-12130, CVE-2019-11091)
      #   "no_stf_barrier" # Disables the Single Thread Indirect Branch Predictors
      #   "noibpb" # Disables the Indirect Branch Predictor Barrier
      #   "nospec_store_bypass_disable" # (CVE-2018-3639)
      #   "noibrs" # (CVE-2017-5715)
      #   "nopti" # (CVE-2017-5754)
      #   "nospectre_v1" # (CVE-2017-5753)
      #   "nospectre_v2" # disables all mitigations for Spectre variant 2
      #   "tsx=on" # enables Intel Transactional Synchronization Extensions (TSX)
      #   "tsx_async_abort=off" # (CVE-2019-11135)
      #   "mitigations=off" # Disable all mitigations
      # ] else [
      #   # NixOS produces many wakeups per second, which is bad for battery life.
      #   "nohz_full=4-7" # This kernel parameter disables the timer tick on the last 4 cores
      #   "randomize_kstack_offset=on" # make stack-based attacks on the kernel harder
      #   "vsyscall=none" # controls the behavior of vsyscalls.
      #   "slab_nomerge" # reduce most of the exposure of a heap attack to a single cache
      #   "debugfs=off" # Disable debugfs which exposes sensitive kernel data
      #   "module.sig_enforce=1" # only allow signed modules
      #   "page_poison=on" # enable buddy allocator free poisoning
      #   "slub_debug=FZP" # for debugging kernel-level slab issues
      #   "sysrq_always_enabled=0" # sysrq is seful for debugging
      #   "fbcon=nodefer" # prevent the kernel from blanking plymouth out of the fb
      #   "lockdown=confidentiality" # blocks access to all kernel memory
      #   "page_alloc.shuffle=1" # performance improvement for direct-mapped memory-side-cache utilization
      #   "rootflags=noatime" # ignore access time (atime) updates on files
      #   "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux" # linux security modules
      #   # Sometimes certain kernel exploits will cause what is called an "oops" which is a kernel panic
      #   # that is recoverable. This will make it unrecoverable, and therefore safe to those attacks
      #   "oops=panic"
      # ];

      blacklistedKernelModules = [
        # Obscure network protocols
        "dccp" # Datagram Congestion Control Protocol
        "sctp" # Stream Control Transmission Protocol
        "rds" # Reliable Datagram Sockets
        "tipc" # Transparent Inter-Process Communication
        "n-hdlc" # High-level Data Link Control
        "netrom" # NetRom
        "x25" # X.25
        "ax25" # Amateur X.25
        "rose" # ROSE
        "decnet" # DECnet
        "econet" # Econet
        "af_802154" # IEEE 802.15.4
        "ipx" # Internetwork Packet Exchange
        "appletalk" # Appletalk
        "psnap" # SubnetworkAccess Protocol
        "p8022" # IEEE 802.3
        "p8023" # Novell raw IEEE 802.3
        "can" # Controller Area Network
        "atm" # ATM

        # Old or rare or insufficiently audited filesystems
        "adfs" # Active Directory Federation Services
        "affs" # Amiga Fast File System
        "befs" # "Be File System"
        "bfs" # BFS, used by SCO UnixWare OS for the /stand slice
        "cramfs" # compressed ROM/RAM file system
        "cifs" # smb (Common Internet File System)
        "efs" # Extent File System
        "erofs" # Enhanced Read-Only File System
        "exofs" # EXtended Object File System
        "freevxfs" # Veritas filesystem driver
        "f2fs" # Flash-Friendly File System
        "vivid" # Virtual Video Test Driver (unnecessary)
        "gfs2" # Global File System 2
        "hpfs" # High Performance File System (used by OS/2)
        "hfs" # Hierarchical File System (Macintosh)
        "hfsplus" # " same as above, but with extended attributes
        "jffs2" # Journalling Flash File System (v2)
        "jfs" # Journaled File System - only useful for VMWare sessions
        "ksmbd" # SMB3 Kernel Server
        "minix" # minix fs - used by the minix OS
        "nfsv3" # " (v3)
        "nfsv4" # Network File System (v4)
        "nfs" # Network File System
        "nilfs2" # New Implementation of a Log-structured File System
        "omfs" # Optimized MPEG Filesystem
        "qnx4" # extent-based file system used by the QNX4 and QNX6 OSes
        "qnx6" # ^
        "squashfs" # compressed read-only file system (used by live CDs)
        "sysv" # implements all of Xenix FS, SystemV/386 FS and Coherent FS.
        "udf" # https://docs.kernel.org/5.15/filesystems/udf.html

        # Disable pc speakers
        "pcspkr"
        "snd_pcsp"
      ];
    };
  };
}
