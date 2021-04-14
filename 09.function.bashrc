# .bashrc

# https://transfer.sh/
function transfer() {
  if [ $# -eq 0 ]; then
    echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
    return 1
  fi

  tmpfile=$( mktemp -t transferXXX )
  if tty -s; then
    basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
  else
    curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
  fi

  cat $tmpfile
  rm -f $tmpfile;
  echo
}


function youtube_to_mp3() {
  if [ $# -eq 0 ]
  then
    echo "usage: youtube_to_mp3 <url>" >&2
    return
  fi

  address=$1
  regex='v=(.*)'
  if [[ $address =~ $regex ]]; then
	  video_id=${BASH_REMATCH[1]}
  	video_id=$(echo $video_id | cut -d'&' -f1)
	  video_title="$(youtube-dl --get-title $address)"
  	youtube-dl $address
	  ext=$(ls $video_id.* |cut -f2 -d'.')
  	ffmpeg -i $video_id.$ext "$video_title".wav
	  lame "$video_title".wav "$video_title".mp3
  	rm $video_id.$ext "$video_title".wav
  else
	  echo "Error... is this a youtube url?"
  fi
}

function change_mac_addr() {
  sudo spoof-mac randomize en0
  return

  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  local iface=en0

  sudo ifconfig ${iface} down
  sudo ifconfig ${iface} ether ${mac}
  sudo ifconfig ${iface} up
  echo "Your new physical address is ${mac}"
}

function backup_google_takeout() {
  if [ $# -eq 0 ]
  then
    echo "usage: backup_google_takeout google_takeout_archive.tar.gz" >&2
    return
  fi

  file=$1
  s3_bucket_name=google-takeout-backups
  s3_file_name=google-takeout-archive.tar.gz

  echo '1- Encrypt'
  openssl aes-256-cbc -a -salt -in ${file} -out /tmp/${s3_file_name} || return
  echo 'ok\n'

  echo '2- Upload'
  aws s3 cp /tmp/${s3_file_name} s3://${s3_bucket_name}/${s3_file_name} --storage-class STANDARD_IA || return
  echo 'ok\n'

  read "response?3- Would you like to remove ${file} ? (y/n) "
  if [[ ${response} =~ ^[Yy]$ ]]
  then
    rm -f ${file}
    echo 'Removed'
  fi
  echo

  rm -f /tmp/${s3_file_name}

  echo "Recovery commands:"
  echo "$ aws s3 cp s3://${s3_bucket_name}/${s3_file_name} /tmp/${s3_file_name}"
  echo "$ openssl aes-256-cbc -a -d -in /tmp/${s3_file_name} -out /tmp/${s3_file_name}.new"
  echo "\nBye"
}

function xiaomi_shit() {
  adb -s 449c9496 reboot-bootloader

  for ((i=0;i<5;i++))
  do
    echo -n .
    sleep 1
  done

  fastboot continue
}

function repeat() {
    # Repeat n times command.

    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

function swap() {
    # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

#function extract() {
#    # Handy Extract Program
#    if [ -f $1 ] ; then
#        case $1 in
#            *.tar.bz2)   tar xvjf $1     ;;
#            *.tar.gz)    tar xvzf $1     ;;
#            *.bz2)       bunzip2 $1      ;;
#            *.rar)       unrar x $1      ;;
#            *.gz)        gunzip $1       ;;
#            *.tar)       tar xvf $1      ;;
#            *.tbz2)      tar xvjf $1     ;;
#            *.tgz)       tar xvzf $1     ;;
#            *.zip)       unzip $1        ;;
#            *.Z)         uncompress $1   ;;
#            *.7z)        7z x $1         ;;
#            *)           echo "'$1' cannot be extracted via >extract<" ;;
#        esac
#    else
#        echo "'$1' is not a valid file!"
#    fi
#}

function watermark_identity_card() {
  if [ $# -neq 3 ]
  then
    echo "usage: watermark_identity_card <text> <source> <destination>" >&2
    return
  fi

  convert -density 150 -fill  "rgba(255,0,0,0.25)"  -gravity Center -pointsize 80 -draw "rotate -45 text 0,0 \"$1\"" "$2" "$3"
}
