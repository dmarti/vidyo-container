#!/bin/sh

[ -e VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_027.rpm ] || \
	wget https://v.mozilla.com/upload/VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_027.rpm
mkdir -p $HOME/.vidyo-container
docker build -t vidyo .

docker run -it \
	--net host \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.vidyo-container/:/home/vidyo \
	-e DISPLAY=unix$DISPLAY \
	--device /dev/snd \
	--device /dev/dri \
	-v /dev/shm:/dev/shm \
	vidyo
