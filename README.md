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
    nodenv global 0.11.9
```

Older Ruby Versions
-------------------

If you're using an older version of Ruby, you may run into an error about
OpenSSL when installing:

```
The Ruby openssl extension was not compiled.
ERROR: Ruby install aborted due to missing extensions
Try running `apt-get install -y libssl-dev` to fetch missing dependencies.
```

Ruby versions < 2.4 [aren't compatible with OpenSSL 1.1][openssl], so you'll
need to install an older version of SSL for these older Ruby versions. You
can do that in your Dockerfile with:

```
RUN apt-get install -y libssl1.0-dev
```

[rbenv]: https://github.com/sstephenson/rbenv
[nodenv]: https://github.com/OiNutter/nodenv
[openssl]: https://github.com/rbenv/ruby-build/issues/1199
