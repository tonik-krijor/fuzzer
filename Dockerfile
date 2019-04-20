FROM debian as builder

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    vim \
    git

# Setup working directory
WORKDIR /app

# Download & build radamsa
RUN git clone https://gitlab.com/akihe/radamsa.git && cd radamsa && make && make install

# Setup user
RUN useradd -ms /bin/bash appuser
RUN chown -R appuser:appuser /app
USER appuser

# Download coreutils
RUN mkdir coreutils
RUN wget -qO- https://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz | tar --strip-components 1 -C $PWD/coreutils -xJf -

# Build coreutils
RUN cd coreutils && ./configure CC="gcc" CXX="g++" CFLAGS=--coverage
RUN make -C coreutils 

# Copy over local files
COPY files/* ./files/
COPY *.sh ./
COPY *.txt ./

# Create empty directories
RUN mkdir in out
