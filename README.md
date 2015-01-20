rbenv + nodenv Docker Image
===========================

This image can be used as a base image for Dockerfiles that require both
Ruby and Node. It sets up [rbenv] and [nodenv], along with their build plugins
and dependencies, but doesn't actually pre-install any version of Ruby or Node.
A Dockerfile building upon this image might look like this:

```dockerfile
FROM noonat/rbenv-nodenv
RUN rbenv install 2.2.0 && \
    CONFIGURE_OPTS="--disable-install-doc" rbenv global 2.2.0 && \
    gem install bundler && \
    nodenv install 0.11.9 && \
    nodenv global 0.11.9 && \
    nodenv rehash
```

[rbenv]: https://github.com/sstephenson/rbenv
[nodenv]: https://github.com/OiNutter/nodenv
