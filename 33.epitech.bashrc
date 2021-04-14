
function epitech_pdf_generator () {
    docker run --rm -v $(pwd):/pdf -u $(id -u):$(id -g) epitechcontent/subject_template $@
}

function validate_html_check() {
  local log_level=${1}
  local f=${2}
  echo "[${log_level}]"
  curl -H "Content-Type: text/html; charset=utf-8" --data-binary @${f} -s \
          https://validator.w3.org/nu/?out=json | jq -r '.messages[] | select(.type=="'${log_level}'") | "line " + (.lastLine|tostring) + ": " + .message'
  echo
}

function validate_html() {
  if [ $# < 2 ]; then
    echo "usage: ./validate-w3c-html.sh <error|info> <index.html> [toto.html] ..."
    return 1
  fi

  log_level=$1
  shift

  for f in "$@"
  do
    echo ${f}
    validate_html_check "error" ${f}
    if [ ${log_level} = "info" ]; then
      validate_html_check "info" ${f}
    fi
  done
}