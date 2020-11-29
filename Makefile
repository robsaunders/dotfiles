build:
	home-manager switch --file home-manager/users/nixos.nix

system:
	echo Installing Dell XPS-15 9500
	sudo bash scripts/install machines/dell-xps-15
	home-manager switch --file home-manager/users/nixos.nix

flake:
	nix flake update --update-input nixpkgs
	nix flake update --update-input home-manager
	sudo nixos-rebuild switch --flake '.#'
