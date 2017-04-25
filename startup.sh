#!/usr/bin/env bash

#
# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -eu

GROUP_EXISTS=$(awk -F':' '$3 ~ /'$HOST_GID'/ {print $1}' /etc/group)
HOST_GROUP="$HOST_USER"

if [[ -z "$GROUP_EXISTS" ]]; then
    groupadd --gid $HOST_GID $HOST_USER
else
    HOST_GROUP="$GROUP_EXISTS"
fi

useradd $HOST_USER --home /home/$HOST_USER --gid $HOST_GID --uid $HOST_UID --shell /bin/bash

echo "$HOST_USER:pw" | chpasswd

cp -r /root/.emacs.d /home/$HOST_USER/

# make sure all permissions are good to go.
chown -R $HOST_USER:$HOST_GROUP /home/$HOST_USER

su $HOST_USER -c "mkdir -p /home/$HOST_USER/.ssh"

su $HOST_USER -c "ssh-keygen -t rsa -b 4096 -P '' -f /home/$HOST_USER/.ssh/id_rsa"

su $HOST_USER -c "echo 'export LEIN_HOME=/opt/lein' >> /home/$HOST_USER/.bashrc"

su $HOST_USER -c "echo 'export TERM=xterm-256color' >> /home/$HOST_USER/.bashrc"

su $HOST_USER -c "echo 'tmate' >> /home/$HOST_USER/.bashrc"

su $HOST_USER
