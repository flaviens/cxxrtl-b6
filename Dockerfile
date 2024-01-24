FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Install apt dependencies
RUN apt-get update && apt-get install -y build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev

RUN apt-get install -y gcc-7
RUN apt-get install -y g++-10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10

# Icarus
RUN apt-get install -y autoconf gperf make gcc g++ bison flex
RUN git clone https://github.com/steveicarus/iverilog.git
RUN cd iverilog && sh autoconf.sh && ./configure && make -j$(nproc) && make install

RUN apt-get install -y g++-7

# Yosys
RUN git clone https://github.com/YosysHQ/yosys.git && cd yosys && git checkout 8649e30 && make config-gcc && make -j$(nproc) && make install

# The experiment
RUN git clone https://github.com/flaviens/cxxrtl-b6.git
RUN cd cxxrtl-b6 && bash run.sh
