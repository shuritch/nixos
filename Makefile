cleaning:
	sudo nix-collect-garbage -d

update:
	nix-channel --update
	nixos-rebuild --upgrade switch
	nix flake update

rebuild:
	nix flake update
	sudo nixos-rebuild switch --flake .
	home-manager switch --flake . #

add-channels:
	sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
	sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
	sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	sudo nix-channel --update

