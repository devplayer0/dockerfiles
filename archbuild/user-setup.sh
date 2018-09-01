#!/bin/bash
set -e

mkdir user/

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg --syncdeps --install --noconfirm
cd ..
rm -rf yay/
paccache --remove --keep 0

yay --afterclean --removemake --save

# self-delete
rm -- "$0"
