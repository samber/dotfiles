# .bashrc

alias reg='docker run --rm -it jess/reg --registry https://index.docker.io --username contact@samuel-berthe.fr --password *****'
alias fig='docker-compose'
alias d='docker'
alias dm='docker-machine'
alias debian='docker run --rm -it -v $(pwd):/app --workdir=/app golang:buster bash'
alias fedora='docker run --rm -it -v $(pwd):/app -w /app epitechcontent/epitest-docker /bin/bash'
alias fedora-gui='docker run --rm -it -v $(pwd):/app -w /app -p 5900-6000:5900-6000 samber/epitech-gui /bin/bash'
#[[ -s "$(brew --prefix dvm)/dvm.sh" ]] && source "$(brew --prefix dvm)/dvm.sh"
#[[ -s "$(brew --prefix dvm)/bash_completion" ]] && source "$(brew --prefix dvm)/bash_completion"

function logs() {
  docker-compose logs -f --tail=100 ${PWD##*/}
}

function docker_pg() {
  echo -n 'Username: '
  read PG_USER
  echo -n 'Password: '
  read PG_PASS
  echo -n 'Database: '
  read PG_DB

  echo
  echo 'Client => ' psql postgres://${PG_USER}:${PG_PASS}@localhost:5432/${PG_DB}
  echo

  docker run --rm -it -p 5432:5432 -e POSTGRES_USER=${PG_USER} -e POSTGRES_PASSWORD=${PG_PASS} -e POSTGRES_DB=${PG_DB} --name postgres postgres:latest
}

function docker_mysql() {
  echo -n 'Username: '
  read MYSQL_USER
  echo -n 'Password: '
  read MYSQL_PASSWORD
  echo -n 'Database: '
  read MYSQL_DATABASE

  echo
  echo 'Client => ' mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h 127.0.0.1 ${MYSQL_DATABASE}
  echo

  docker run --rm -it -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DATABASE=${MYSQL_DATABASE} --name mysql mysql:latest --default-authentication-plugin=mysql_native_password
}

function fig_reset() {
  fig kill $1
  fig rm -vf $1
  fig up -d $1
  fig logs -f $1
}