
export REMOTE_DEV_SERVER=163.172.179.195

alias remote_docker='eval $(docker-machine env default) && echo OK'
alias remote_docker_reset='eval $(docker-machine env -u) && echo OK'

alias remote_ping='ping ${REMOTE_DEV_SERVER}'

function remote_ports() {
  ports_list=$(pwd -P)/.ports
  size=$(cat ${ports_list} | wc -l)
  cat ${ports_list} | xargs -I {} echo Forwarding {}

  echo
  echo Enter ctrl-c to Quit
  echo

  cat ${ports_list} | xargs -P ${size} -I {} ssh -NL 127.0.0.1:{}:127.0.0.1:{} root@${REMOTE_DEV_SERVER}
}

# function remote_sync() {
#   echo "Enter ctrl-c to quit\n"
#   ssh root@${REMOTE_DEV_SERVER} mkdir -p $(pwd -P)
#
#   # parenthesis to run a single process and quit on ctrl-c
#   (
#     while true; do
#       rsync -avzhP . root@${REMOTE_DEV_SERVER}:$(pwd -P) --del --exclude .git
#       fswatch -l 0.5 -r -1 .
#     done
#   )
# }

function remote_sync() {
  dir=$(pwd -P)
  tmpfile=$(mktemp /tmp/lsyncd.XXXXXX)

  cat <<EOF > ${tmpfile}
  settings {
    nodaemon   = true,
    insist     = true,
    maxProcesses = 1,
    maxDelays  = 0.5,
  }
  sync {
    default.rsyncssh,
    source="${dir}",
    host="${REMOTE_DEV_SERVER}",
    exclude={ '.git/', 'node_modules/' },
    targetdir="${dir}",
    delete = true,
    rsync = {
      binary="/usr/local/bin/rsync",
      archive = true,
      compress = true,
      whole_file = false,
      owner = true,
      group = true,
      chown = "root:root"
    },
    ssh = {
      port = 22
    }
  }
EOF

  ssh root@${REMOTE_DEV_SERVER} mkdir -p ${dir}
  sudo lsyncd ${tmpfile}

  rm -f ${tmpfile}
}

alias remote_server_start='scw start remote-dev-server'
alias remote_server_stop='scw stop remote-dev-server'
