# Partition drive for install

bash```
sudo nix -experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix --arg device '"/dev/vda"'

```

Check the disk layout with lsblk.


```

