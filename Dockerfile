FROM ubuntu:18.04
MAINTAINER hanxi <hanxi.info@gmail.com>

ENV FORCE_UNSAFE_CONFIGURE=1
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./sources.list /etc/apt/sources.list
RUN rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc \
    && apt-get -qq update \
    && apt-get -y install --no-install-recommends \
    build-essential asciidoc binutils bzip2 curl gawk gettext git libncurses5-dev libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf \ 
    wget curl swig rsync sudo git \
    && groupadd -r build && useradd -r -u 1000 -g build build \
    && echo '%build ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && apt-get -y purge manpages xauth \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \ 
    && chown -R build:build /home/build

USER build
WORKDIR /home/build

# COPY ./diy-part1.sh /data/diy-part1.sh
# COPY ./diy-part2.sh /data/diy-part2.sh
# COPY ./.config /data/.config
# COPY ./build-lede.sh /data/build-lede.sh


CMD ["/bin/bash"]

