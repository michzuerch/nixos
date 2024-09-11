# nixos

Nixos configuration michzuerch 2024

## Single line installer

''bash
nix-shell -p git --command "nix run github:michzuerch/nixos --experimental-features nix-command - --experimental-features flakes"
''

## nixos-install

''bash
nixos-install --flake .#<host>
''

## build iso for installer

''bash
nix build .#nixosConfigurations.installerIso.config.system.build.isoImage
''

## install

''bash
nixos-install --impure --flake https://github.com/michzuerch/nixos#ThinkpadNomad
''

## installer with birdee

sudo nix run github:nix-community/disko -- --mode disko --flake github:BirdeeHub/birdeeSystems#$hostname
sudo nixos-install --flake github:BirdeeHub/birdeeSystems#$hostname

## sops

''bash
sops secrets.yaml
''
