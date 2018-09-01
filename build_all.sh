#!/bin/bash

build_image() {
	docker build -t devplayer0/$1:latest $1/
}

for image in */; do
	image=${image%/}

	build_image "$image"
done
