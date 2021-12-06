FROM archlinux:latest

LABEL org.opencontainers.image.source https://github.com/nikp123/docker-archlinux-mingw64-ownstuff

WORKDIR /mnt

# Append ownstuff's repo to the arch install
RUN echo $'\n\
[ownstuff]\n\
Server = https://martchus.no-ip.biz/repo/arch/$repo/os/$arch\n\
Server = https://ftp.f3l.de/~martchus/$repo/os/$arch\n\
SigLevel = Optional TrustAll' >> /etc/pacman.conf

# Update Arch
RUN pacman -Syyu --noconfirm

# Install basic C/C++ development tools
RUN yes | pacman --noconfirm -S binutils mingw-w64-binutils mingw-w64-crt \
    mingw-w64-headers mingw-w64-winpthreads mingw-w64-cmake mingw-w64-gcc \
    mingw-w64-extra-cmake-modules mingw-w64-make mingw-w64-pkg-config make

