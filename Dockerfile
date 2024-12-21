# Use the Fedora base image
FROM fedora:latest

# Switch to root user for system updates
USER root

# Update system and install required packages
RUN dnf update -y && \
    dnf install -y sudo base-devel clang lldb llvm fish git binutils ncurses elfutils-libelf openssl perl rsync tar xz zstd \
    bc bison build-essential ccache curl flex g++ gcc git-lfs gnupg gperf imagemagick libncurses5-dev liblz4-tool libncurses5 libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev device-tree-compiler python3 \
    ncurses-compat-libs readline-devel.i686 zlib-devel.i686 wxGTK3-devel 

# Create gitpod user
RUN useradd -u 33333 -m -s /usr/bin/fish gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

# Set fish as default shell
SHELL ["fish", "--command"]
RUN chsh -s /usr/bin/fish
ENV SHELL /usr/bin/fish

# Entrypoint
ENTRYPOINT ["fish"]
