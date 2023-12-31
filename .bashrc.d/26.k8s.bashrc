
export KUBECONFIG=~/.kube/config.yml:~/.kube/kubeconfig.yml

alias kube=kubectl
alias k=kubectl

source <(stern --completion zsh)
