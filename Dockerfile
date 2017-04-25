FROM ubuntu:16.04

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends --fix-missing \
    openjdk-8-jdk-headless maven emacs-nox curl tmux openssh-client jq && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

ENV LEIN_ROOT=1
ENV LEIN_HOME=/opt/lein

RUN mkdir -p /opt/lein && \
    cd /usr/local/bin && \
    curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod a+x ./lein

RUN cd /usr/local/bin && \
    curl -L https://github.com/tmate-io/tmate/releases/download/2.2.1/tmate-2.2.1-static-linux-amd64.tar.gz | \
    tar xzf - --strip-components=1 && \
    chmod a+x tmate

ADD startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh

RUN mkdir /root/.emacs.d

ADD init.el /root/.emacs.d/init.el

# Cache dependencies
RUN lein

RUN emacs --daemon

RUN mkdir /project

WORKDIR /project

CMD ["/root/startup.sh"]
