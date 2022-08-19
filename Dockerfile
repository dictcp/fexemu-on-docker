FROM ubuntu:22.04

RUN apt update && \
    apt -y install git build-essential cmake clang ninja-build pkg-config cmake-data libsdl2-dev libepoxy-dev

RUN git clone --recurse-submodules https://github.com/FEX-Emu/FEX FEX-2207 -b FEX-2207

ADD skip-rootfs.patch ./skip-rootfs.patch

RUN cd FEX-2207 && \
    patch -p1 < ../skip-rootfs.patch && \
    mkdir Build && cd Build && \
    CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  -DBUILD_TESTS=False -DENABLE_ASSERTIONS=False -DENABLE_STATIC_PIE=True -DENABLE_LTO=False -G Ninja .. && \
    ninja
