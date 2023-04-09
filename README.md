# Dotfiles
NixOS環境構築用dotfile

```bash
$ git clone https://192.168.3.15:8080/dotfile.git ~/.dotfiles
$ sudo nix home-manager switch --flake "./#hiroki@Aoi-Dell-Inspiron"
$ sudo nixos-rebuild switch --flake "./#Aoi-Dell-Inspiron"
```