FROM alpine:3.8

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
    bash~=4 \
    curl~=7 \
    emacs-nox~=26 \
    openjdk8~=8 \
    openssh-client~=7 \
    openssh-keygen~=7 \
    shadow~=4 \
    tmate@testing~=2 && \
    curl -L -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod a+x /usr/local/bin/* && \
    lein && \
    adduser -D -h /home/clojure -s /bin/bash clojure && \
    chown clojure:clojure /home/clojure -R && \
    su clojure -c 'emacs --daemon'

WORKDIR /project

CMD ["/usr/local/bin/startup.sh"]
