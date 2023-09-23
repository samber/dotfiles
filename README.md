
# Dotfiles 🤘

```bash
brew update
brew upgrade

brew install ansible aria2 awscli azure-cli bash-completion ca-certificates cffi clever-tools clickhouse cloudflared cmake cocoapods composer coreutils csshx curl ffmpeg findutils gh git git-lfs glog gnupg gnutls gnu-sed go golangci-lint grep heroku htop hub hugo imagemagick jq kubectx kubernetes-cli kubeval libarchive libffi lz4 maven minikube moreutils mysql nancy nmap node nvm openjdk openssl openvpn packer parquet-cli pgbadger php pinentry poetry postgresql@14 pwgen python@3.11 rabbitmq rbenv redis restic rsync rtl_433 ruby s3cmd sbt scala scw snappy sqlite stripe terraform tfenv tflint tmux tree virtualenv wangle watch websocat wget youtube-dl yq zsh zsh-completion

brew install --cask iterm2
brew install --cask vlc
```

```bash
npm install -g wscat react-native hest ts-node typescript yo http-proxy nodemon webpack gulp grunt
```

```bash
git clone https://github.com/samber/dotfiles.git ~/.dotfiles
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

rm -rf /Users/samber/.oh-my-zsh/custom
rm -f /Users/samber/.config/karabiner/karabiner.json

cd
ln -s /Users/samber/.dotfiles/.oh-my-zsh/custom /Users/samber/.oh-my-zsh/custom
ln -s /Users/samber/.dotfiles/.bashrc.d
ln -s /Users/samber/.dotfiles/.zshrc
ln -s /Users/samber/.dotfiles/.gitconfig
ln -s /Users/samber/.dotfiles/.tmux.conf
ln -s /Users/samber/.dotfiles/.emacs
ln -s /Users/samber/.dotfiles/.emacs.d
ln -s /Users/samber/.dotfiles/.config/karabiner/karabiner.json /Users/samber/.config/karabiner/karabiner.json
```

```bash
clever login
scw init
aws configure
docker login
```

Missing:

- /usr/local/bin
- /usr/local/src
- ~/.ssh
