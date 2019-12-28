
function epitech_clone_student () {
    # only if you have read permissions
    git clone git@git.epitech.eu:/${1}/${2} ${1}
}

function epitech_clone_pgt5 () {
    if [ "$#" -ne 1 ]; then
        echo "usage: epitech_clone USP_spying_trantor_2018" 1>&2
        return
    fi

    epitech_clone_student ivain.lamarche@epitech.eu ${1}
    epitech_clone_student julien.delahaye@epitech.eu ${1}
    epitech_clone_student karim.moussaoui@epitech.eu ${1}
    epitech_clone_student barret_l ${1}
    epitech_clone_student huiban_t ${1}
}

function epitech_clone_msc1 () {
    if [ "$#" -ne 1 ]; then
        echo "usage: epitech_clone USP_spying_trantor_2018" 1>&2
        return
    fi

    epitech_clone_student anatole.acqueberge@epitech.eu ${1}
    epitech_clone_student brieuc.de-lantivy@epitech.eu ${1}
    epitech_clone_student guillaume.caze-francois@epitech.eu ${1}
}

function epitech_clone_pre_msc () {
    if [ "$#" -ne 1 ]; then
        echo "usage: epitech_clone USP_spying_trantor_2018" 1>&2
        return
    fi

    epitech_clone_student arthur.baron@epitech.eu ${1}
    epitech_clone_student benoit.de-marion@epitech.eu ${1}
    epitech_clone_student florian.cargouet@epitech.eu ${1}
    epitech_clone_student kevin.bony@epitech.eu ${1}
    epitech_clone_student maxime.bouchet@epitech.eu ${1}
    epitech_clone_student mehdi.belhaj@epitech.eu ${1}
    epitech_clone_student reda.lamini@epitech.eu ${1}
    epitech_clone_student thomas.maisnier@epitech.eu ${1}
    epitech_clone_student william.pierre@epitech.eu ${1}
    epitech_clone_student thibault.vandamme@epitech.eu ${1}

    epitech_clone_student johan.wilbrenninck@epitech.eu ${1}
    epitech_clone_student romain1.lefebvre@epitech.eu ${1}
    epitech_clone_student hugo.allegaert@epitech.eu ${1}
}

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