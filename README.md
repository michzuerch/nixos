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
nix build .#nixosConfigurations.InstallerIso.config.system.build.isoImage
''

Alternative

''bash
nix run nixpkgs#nixos-generators -- --format iso --flake ./flake.nix#InstallerIso -o result
''

Working version

''bash
cd installer
nix build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-configuration.nix
''
