FROM fedora:26
RUN dnf update -y

# best guess at required packages
RUN dnf install -y zenity mesa-libGLU libXScrnSaver \
		   glx-utils mesa-dri-drivers \
		   libcanberra-gtk2 libcanberra-gtk3 \
		   PackageKit-gtk3-module libXv

COPY VidyoDesktopInstaller-sl564-TAG_VD_3_3_0_027.rpm /var/tmp/vidyo.rpm
RUN dnf install -y /var/tmp/vidyo.rpm

# Run as non privileged user
RUN adduser vidyo
USER vidyo

# Autorun 
ENTRYPOINT [ "VidyoDesktop" ]
