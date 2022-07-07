. /startup/10-setup-bash.sh
. /startup/20-copy-code-extension.sh
chown beyond:power /var/run/docker.sock
code-server --bind-addr 0.0.0.0:8080