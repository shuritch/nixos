{
  version = "24.05";
  originVersion = "23.11";
  hostname = "nixos";
  platform = "x86_64-linux";
  global-environment = { EDITOR = "nvim"; };
  flake-location = "/home/sashapop10/Desktop/system";
  default-database = "mydatabase";
  main-user = {
    login = "sashapop10";
    name = "Alexander Ivanov";
    email = "sashapop10@yandex.ru";
    password = # mkpasswd
      "$y$j9T$Cd4bLOks8pPZ4un7UwGdE/$0G1zqKgCiJpmRaFAFN8MIC5LUpIwbrqq65vgLgYAD30";
  };
}
