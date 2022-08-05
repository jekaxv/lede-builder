FROM ubuntu:20.04
  
ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && \
  apt-get full-upgrade -y && \
  apt-get install -y git && \
  apt-get install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
        bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
        git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
        libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
        mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils \
        rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev


RUN git clone https://github.com/coolsnowwolf/lede && \
  cd lede && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a


WORKDIR /lede
