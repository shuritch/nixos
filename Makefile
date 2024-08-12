cleaning:
	sudo nix-collect-garbage -d

update:
	nix-channel --update
	nix flake update
	sudo nixos-rebuild --upgrade switch --flake .
55.751573x37.618999
rebuild:
	nix flake update
	sudo nixos-rebuild switch --flake .

rebuild-home:
	home-manager switch --flake .

repair-boot:
	sudo nixos-rebuild --install-bootloader boot --flake .

repair-store:
	sudo nix-store --verify --repair --check-contents

test:
	nix flake check --verbose

add-channels:
	sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
	sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
	sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	sudo nix-channel --update
