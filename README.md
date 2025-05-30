
# Dotfiles 🤘

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/samber/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

brew tap heroku/brew
brew tap sonatype-nexus-community/nancy-tap
brew tap CleverCloud/homebrew-tap
brew tap Bearer/tap
brew tap johanhaleby/kubetail

brew install ansible aria2 awscli azure-cli bash-completion bearer ca-certificates clever-tools cffi clickhouse cloudflared cmake cocoapods composer coreutils csshx curl duckdb emacs ffmpeg findutils fzf gcc gdbm gh git git-lfs gitleaks glog gnupg gnutls gnu-sed gnu-tar gnu-getopt go goreleaser golangci-lint grep helm helmfile heroku htop hub hugo imagemagick jq k9s krew kubectx kubetail kubernetes-cli kubeval libarchive libffi lz4 maven minikube moreutils mysql nancy nmap node nvm openjdk openssl openvpn packer parquet-cli pgbadger php pinentry poetry postgresql@14 pwgen python@3.9 python@3.12 rabbitmq rbenv redis restic rsync rtl_433 ruby s3cmd sbt scala scw snappy sqlite stern stripe terraform tfenv tflint tmux tree virtualenv wangle watch websocat wget youtube-dl yq zsh zsh-completion

brew install --cask iterm2
brew install --cask vlc
```

```bash
npm install -g wscat react-native hest ts-node typescript yo http-proxy nodemon webpack gulp grunt
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
ln -s /Users/samber/.dotfiles/.psqlrc
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

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Missing:

- /usr/local/bin
- /usr/local/src
- ~/.ssh

## Apps

- Alfred 4
- AltTab
- Be focused
- BetterDictation
- brave
- caffeine
- chromium
- dashlane
- dbeaver
- discord
- enpass
- evernote
- figma
- filezilla
- firefox
- gimp
- google chrome
- google chrome canary
- google drive
- google earth
- hidden bar
- inyourface
- iterm
- karabiner
- kubecontext
- linear
- loom
- macdown
- messenger
- microsoft word/excel/powerpoint
- microsoft teams
- neat
- notion
- orbstack
- pgadmin 4
- poe
- scroll reverser
- slack
- stats https://github.com/exelban/stats
- suuntolink
- teamviewer
- todoist
- tor browser
- utm
- vscode
- vnc viewer
- vlc
- whatsapp
- wireshark
- xcode
- xcodes
- zoom

## other

- epson drivers

## Migrate gpg keys

https://gist.github.com/Killeroid/6361944d0694e474fb94cc42a3b119d1
