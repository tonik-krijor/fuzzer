FROM alpine

# Install required packages
RUN apk add --no-cache \
  build-base \
  acl-dev \
  attr-dev \ 
  gmp-dev \ 
  libcap-dev \
  bc \
  perl \
  bash \
  vim

# Setup default compilers
ENV CC gcc
ENV CXX g++

# Setup working directory
WORKDIR /app

# Setup user
RUN adduser -D appuser
RUN chown appuser:appuser /app
USER appuser

# Download coreutils
RUN mkdir coreutils
RUN wget -qO- https://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz | tar --strip-components 1 -C $PWD/coreutils -xJf -

# Build coreutils
RUN cd coreutils && ./configure CFLAGS=--coverage
RUN make -C coreutils
ENV SRC /app/coreutils/src

# Create coverage links for `dir` command.
RUN ln -s $SRC/ls.gcno $SRC/dir.gcno
RUN ln -s $SRC/ls.gcda $SRC/dir.gcda

# Create coverage links for `vdir` command.
RUN ln -s $SRC/ls.gcno $SRC/vdir.gcno
RUN ln -s $SRC/ls.gcda $SRC/vdir.gcda

# Download radamsa
RUN mkdir radamsa
RUN wget -qO- https://gitlab.com/akihe/radamsa/-/archive/develop/radamsa-develop.tar.gz | tar --strip-components 1 -C $PWD/radamsa -xzf -

# Build radamsa
RUN make -C radamsa
ENV PATH /app/radamsa/bin:$PATH

# Copy over local files
COPY --chown=appuser files files
COPY --chown=appuser *.sh ./
COPY --chown=appuser pre pre
COPY --chown=appuser init init
COPY --chown=appuser final final

CMD [ "/bin/bash" ]
