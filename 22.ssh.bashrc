# .bashrc

# ssh shortcuts
alias ks='ssh ks'
alias dedibox-s="ssh dedibox-s"
alias dedibox-m="ssh dedibox-m"

function ssh_clever() {
    # $1 must be an instance_id or app_id
    ssh -t ssh@sshgateway-clevercloud-customers.services.clever-cloud.com $1
}
