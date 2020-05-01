FROM rocker/shiny:3.6.3

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  cmake \
  git \
  liblz4-dev \
  libssl-dev \
  libzstd-dev \
  && apt-get clean

RUN cd /home/shiny \
  && git clone --single-branch --branch release-1.7.7 https://github.com/TileDB-Inc/TileDB.git tiledb \
  && cd tiledb \
  && mkdir build \
  && cd build \
  && ../bootstrap --prefix=/usr/local --enable-serialization \
  && make -j 8 \
  && make -C tiledb install \
  && ldconfig \
  && cd /home/shiny \
  && rm -rf tiledb

RUN install2.r --error --deps FALSE remotes \
  && installGithub.r TileDB-Inc/TileDB-R \
  && rm -rf /tmp/downloaded_packages
