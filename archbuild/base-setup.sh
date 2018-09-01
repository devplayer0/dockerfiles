#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime

sed -i 's/#\(en_IE\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
echo "LANG=en_IE.UTF-8" > /etc/locale.conf

pacman -Syu --noconfirm base-devel git

useradd --create-home --home-dir /build --groups wheel build
sed -i '/%wheel ALL=[(]ALL[)] NOPASSWD: ALL/s/^#\s*//g' /etc/sudoers

# self-delete
rm -- "$0"
