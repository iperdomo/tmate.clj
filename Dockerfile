FROM alpine:3.17

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LEIN_ROOT=1
ENV LEIN_HOME=/opt/lein

COPY init.el /home/clojure/.emacs.d/init.el
COPY startup.sh /usr/local/bin/startup.sh
COPY bashrc /home/clojure/.bashrc

RUN set -ex; \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache \
    bash~=5 \
    curl~=7 \
    emacs-nox~=28 \
    openjdk11~=11 \
    openssh-client-common~=9 \
    openssh-keygen~=9 \
    shadow~=4 \
    su-exec~=0.2 \
    tmate@testing~=2 && \
    curl -L -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod a+x /usr/local/bin/* && \
    lein && \
    adduser -D -h /home/clojure -s /bin/bash clojure && \
    chown clojure:clojure /home/clojure -R && \
    su clojure -c 'emacs --daemon'

WORKDIR /project

ENTRYPOINT ["/usr/local/bin/startup.sh"]
