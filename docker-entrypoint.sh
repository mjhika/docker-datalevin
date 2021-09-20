#!/bin/bash

set -e

if [ "$1" = 'supervisord' ]; then

  cat <<EOF > /etc/supervisor/conf.d/supervisord.conf
[supervisord]
nodaemon=true
childlogdir=/var/log/supervisor
loglevel=info

[program:datalevin]
command=dtlv serv -r /data
redirect_stderr=true

EOF

fi

exec "$@"