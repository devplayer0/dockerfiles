#!/bin/bash

build_image() {
	docker build -t devplayer0/$1:latest $1/
}

build_image archbuild
build_image mingw64
