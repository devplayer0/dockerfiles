#!/bin/bash
cd /build

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg --syncdeps --install --noconfirm
cd ..
rm -rf /build/.cache/ yay/

# self-delete
rm -- "$0"
