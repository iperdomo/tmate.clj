#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LEIN_HOME=/opt/lein
export TERM=xterm-256color
alias e=emacs

[[ -d .ssh ]] || mkdir .ssh

[[ -f .ssh/id_rsa ]] || ssh-keygen -t rsa -b 4096 -P '' -f /home/clojure/.ssh/id_rsa
