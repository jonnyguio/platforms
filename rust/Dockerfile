# Copyright 2018 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

FROM  tsuru/base-platform
ADD . /var/lib/tsuru/rust
RUN sudo cp /var/lib/tsuru/rust/deploy /var/lib/tsuru
RUN set -ex; \
    sudo /var/lib/tsuru/rust/install; \
    sudo rm -rf /var/lib/apt/lists/*
