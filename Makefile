cleaning:
	sudo nix-collect-garbage -d

update:
	nix-channel --update
	nixos-rebuild --upgrade switch

add-channels:
	sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
	sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
	sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	sudo nix-channel --update

setup:
	cp -r ./* /etc/nixos/
	sudo nixos-rebuild switch
