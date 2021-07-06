FROM ubuntu:20.04

# Install packages
RUN apt-get update -y && apt-get upgrade -y
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y build-essential curl git python3 python2 pkg-config
# Install rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Fetch source
RUN mkdir /root/mmtk-v8-workspace
WORKDIR /root/mmtk-v8-workspace
# Fetch V8
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/root/mmtk-v8-workspace/depot_tools:${PATH}"
RUN gclient
RUN fetch v8
RUN gclient sync
# Clone MMTk
RUN git clone https://github.com/mmtk/mmtk-v8.git


WORKDIR /root/mmtk-v8-workspace
COPY ./args-debug.gn ./v8/out/x64.debug-mmtk/args.gn
COPY ./args-optdebug.gn ./v8/out/x64.optdebug-mmtk/args.gn
COPY ./Makefile ./Makefile
CMD make check