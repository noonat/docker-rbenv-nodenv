FROM debian:jessie
MAINTAINER Nathan Ostgard <noonat@phuce.com>

ENV DEBIAN_FRONTEND noninteractive

# Install build dependencies. Note that python is required to build Node.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    autoconf bison build-essential curl git-core libcurl4-openssl-dev \
    libffi-dev libgdbm3 libgdbm-dev libreadline-dev libncurses5-dev \
    libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev \
    python sqlite3 zlib1g-dev

# Clone everything, and setup the path.
RUN git clone git://github.com/sstephenson/rbenv.git /root/.rbenv && \
    git clone git://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build && \
    git clone git://github.com/sstephenson/rbenv-gem-rehash.git /root/.rbenv/plugins/rbenv-gem-rehash && \
    git clone git://github.com/OiNutter/nodenv.git /root/.nodenv && \
    git clone git://github.com/OiNutter/node-build.git /root/.nodenv/plugins/node-build
ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/root/.nodenv/shims:/root/.nodenv/bin:$PATH

CMD ["/bin/bash"]
