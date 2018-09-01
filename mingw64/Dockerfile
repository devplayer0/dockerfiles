FROM devplayer0/archbuild:latest

ENV PKG_CONFIG_ALLOW_CROSS=1
RUN yay -Sy --noconfirm --noremovemake \
	mingw-w64-binutils-bin \
	mingw-w64-headers-bin \
	mingw-w64-crt-bin \
	mingw-w64-winpthreads-bin
RUN yay -S --noconfirm --noremovemake mingw-w64-gcc-bin
