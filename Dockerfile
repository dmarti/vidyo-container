FROM fedora:26
# RUN dnf update -y

# best guess at required packages
RUN dnf install -y zenity mesa-libGLU libXScrnSaver \
		   glx-utils mesa-dri-drivers \
		   libcanberra-gtk2 libcanberra-gtk3 \
		   PackageKit-gtk3-module libXv
RUN dnf install -y xorg-x11-server-Xspice
RUN dnf install -y xorg-x11-server-Xnest
RUN dnf install -y xterm
RUN dnf install -y tint2

COPY VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_027.rpm /var/tmp/vidyo.rpm
RUN dnf install -y /var/tmp/vidyo.rpm

# Run as non privileged user
RUN adduser vidyo
COPY start-vidyo.sh /usr/local/bin/start-vidyo.sh
RUN ls /usr/local/bin
USER vidyo

# Autorun 
ENTRYPOINT /usr/local/bin/start-vidyo.sh
# ENTRYPOINT /bin/sh
