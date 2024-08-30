config:

let inherit (builtins) filter hasAttr;
in filter (group: hasAttr group config.users.groups) [
  "audio"
  "deluge"
  "git"
  "i2c"
  "libvirtd"
  "lxd"
  "mysql"
  "network"
  "podman"
  "video"
  "wireshark"
  "docker"
  "minecraft"
  "networkmanager"
  "wheel"
  "input"
  "libvirtd"
  "tpws"
]
