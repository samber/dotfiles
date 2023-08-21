# .bashrc

# Network
alias socks="ssh -ND 60080 root@dedibox"
alias connections_nbr="netstat -na | grep ESTAB | tr -s \" \" | cut -f 4 -d \" \" | cut -d: -f2 | sort | uniq -c | sort -nr | head"
alias connections_client_list="netstat -na | grep ESTAB | tr -s \" \" | cut -f 5 -d \" \" | cut -d: -f1 | sort | uniq -c | sort -nr | head"
alias public_ip="ip route get 8.8.8.8 | head -1 | cut -d' ' -f8"
alias 0='a 0'
alias 8='ping 8.8.8.8'

# Softwares
alias meteo="curl -4 http://wttr.in/Nantes"
#alias db='dropbox start'
#alias evernote='nixnote2'
#alias al='alsamixer'
#alias s='soundcloud'
#alias slack='scudcloud'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
