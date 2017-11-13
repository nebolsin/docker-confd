nebolsin/confd
====================
[![](https://images.microbadger.com/badges/version/nebolsin/confd.svg)](https://microbadger.com/images/nebolsin/confd)
[![](https://images.microbadger.com/badges/image/nebolsin/confd.svg)](https://microbadger.com/images/nebolsin/confd)
[![](https://images.microbadger.com/badges/commit/nebolsin/confd.svg)](https://microbadger.com/images/nebolsin/confd)

A minimalistic Docker image to use confd in multi-stage builds.

Based on the official [confd instructions](https://github.com/kelseyhightower/confd/blob/master/docs/installation.md#build-for-your-image-using-multi-stage-build).

**WIP** This is an experimental repo, don't use it **WIP**

Usage
-----

Add confd and config templates to your image:

```Dockerfile
FROM nebolsin/confd:0.14.0-alpine as confd

FROM alpine:latest

COPY --from=confd /app/bin/confd /usr/local/bin/confd
COPY templates /etc/confd/templates/
COPY conf.d /etc/confd/conf.d/

# ...
```

Generate configs in runtime:

```shell
/usr/local/bin/confd -backend env -onetime
```

License
-------

Configuration files and code in this repository are distributed under the
[MIT license](LICENSE).

License information for the software contained in nebolsin/confd
Docker image:

* [confd](https://github.com/kelseyhightower/confd/blob/master/LICENSE)
