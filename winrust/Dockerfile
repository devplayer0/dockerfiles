FROM devplayer0/mingw64:latest

RUN sudo pacman -Syu --noconfirm rustup && \
	paccache --remove --keep 0 && \
	rustup default nightly-x86_64-unknown-linux-gnu && \
	rustup target add x86_64-pc-windows-gnu
