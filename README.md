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
cd installer
nix build .#nixosConfigurations.default.config.system.build.isoImage
''

## install

''bash
nixos-install --impure --flake https://github.com/michzuerch/nixos#ThinkpadNomad
''
