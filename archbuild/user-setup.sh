#!/bin/bash
cd /build

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg --syncdeps --install --noconfirm
cd ..
rm -rf yay/

# self-delete
rm -- "$0"
