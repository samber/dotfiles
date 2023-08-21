# .bashrc

alias branch='git branch '
alias pull='git pull '
alias push='git push '
alias status='git status '
alias add='git add '
alias log='git log --graph --decorate '
alias rebase='git rebase -i '
alias commit='git commit -m '
alias fix='git commit -m fix'
alias wip='git commit -m wip'
alias oops='git commit -m oops'
alias fuck='git commit -m fuck'
alias merge='git commit -m merge'
alias backup='git commit -m backup'
alias debug='git commit -m debug'
alias lipstick='git commit -m ":lipstick:"'
alias git='hub'

export PATH=${PATH}:${HOME}/lib/vsts-cli/bin

function yolo() {
  local COLUMNS=10
  while true; do
    CHOICE_A=$(curl -s https://whatthecommit.com/index.txt)
    CHOICE_B=$(curl -s https://whatthecommit.com/index.txt)
    CHOICE_C=$(curl -s https://whatthecommit.com/index.txt)
    select MSG in ${CHOICE_A} ${CHOICE_B} ${CHOICE_C} other
    do
      echo
      [[ ${MSG} != "" ]] && break
    done
    [[ ${MSG} != "other" ]] && break
  done
  git commit -m "${MSG}"
}

function git_show_by_email() {
  git log --author=${1} --pretty=format:"%h" | xargs git show
}

function trigger_vsts_build() {
  instance=$1
  project=$2
  auth=${VSTS_USERNAME}:${VSTS_ACCESS_TOKEN}
  version="2.0"

  SHORT_COMMIT_ID=$(git rev-parse --short HEAD)
  BRANCH=$(git rev-parse --abbrev-ref HEAD)

  echo $(curl "https://${instance}.visualstudio.com/DefaultCollection/${project}/_apis/build/builds?api-version=${version}" \
            -X POST \
            -L \
            -H 'Content-type: application/json' \
            -u "${auth}" \
            -d '{"definition":{"id":1}, "parameters": "{\"SHORT_COMMIT_ID\":\"'${SHORT_COMMIT_ID}'\"}", "sourceBranch": "'${BRANCH}'"}' \
           | jq -r '._links.web.href')
}

function github() {
   open https://github.com/$(git remote -v | grep origin | sed 's#.*git@github.com:##g' | sed 's#.git.*##g' | head -n1)
}

function ci() {
  sleep 1
  if [ $(git remote -v | grep -c gitlab) != 0 ]; then
    open https://gitlab.com/$(git remote -v | grep origin | sed 's#.*git@gitlab.com:##g' | sed 's#.git.*##g' | head -n1)/-/jobs
  elif [ $(git remote -v | grep -c github) != 0 ]; then
    open https://circleci.com/gh/$(git remote -v | grep origin | sed 's#.*git@github.com:##g' | sed 's#.git.*##g' | head -n1)
  else
    echo I\'m lost
  fi
}
