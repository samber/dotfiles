
export KUBECONFIG=~/.kube/config
# export KUBECONFIG=~/.kube/config:$(find ~/.kube/ -type f | tr '\n' ':')
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias kube=kubectl
alias k=kubectl

source <(stern --completion zsh)
