#!/bin/bash
set -e

cd /build

yay -S --noconfirm \
	mingw-w64-binutils-bin \
	mingw-w64-headers-bin \
	mingw-w64-crt-bin \
	mingw-w64-winpthreads-bin
yay -S --noconfirm mingw-w64-gcc-bin
rm -rf /build/.cache/ yay/

# self-delete
rm -- "$0"
