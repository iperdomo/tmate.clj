#!/usr/bin/env bash

set -eu

HOST_UID=$(stat -c '%u' /project)
HOST_GID=$(stat -c '%g' /project)

groupmod -g "${HOST_GID}" -o clojure >/dev/null 2>&1
usermod -u "${HOST_UID}" -o clojure >/dev/null 2>&1

su-exec clojure bash
