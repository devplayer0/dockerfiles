#!/bin/bash
set -e

echo 'export PATH=$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl' >> .bashrc

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
