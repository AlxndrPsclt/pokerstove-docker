FROM ubuntu:latest

WORKDIR /usr/src/app

RUN mkdir /usr/src/init
#COPY requirements.txt /usr/src/init/

RUN apt-get update && apt-get install -y \
    build-essential \
    libboost-all-dev \
    cmake \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/andrewprock/pokerstove.git
RUN mkdir pokerstove/build
RUN cd pokerstove/build && cmake -DCMAKE_BUILD_TYPE=Release .. && make
