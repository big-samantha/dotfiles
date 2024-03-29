# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"
#

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# shellcheck disable=SC2034
plugins=(git) 

source "$ZSH/oh-my-zsh.sh"

# Set general path
export PATH=~/.local/bin:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/zee/Library/Python/2.7/bin:$PATH

# Append rbenv stuff to path if it exists
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$PATH
fi

if [ -d /usr/local/opt/go/libexec/bin ]; then
  export PATH=/usr/local/opt/go/libexec/bin:$PATH
fi

#options
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
set -o vi
set editing-mode vi
bindkey -v
set blink-matching-paren on

#aliases
alias tmux="tmux -2"
alias tns="tmux new -s"
alias ta="tmux attach"
alias tks='tmux kill-session -t'
alias decrypt='gpg -d'
alias 'gi'='gem install --no-ri --no-rdoc --verbose'
alias psp='pry --simple-prompt'
alias vrnp='vagrant reload --no-provision'
alias vunp='vagrant up --no-provision'
alias vs='vagrant status'
alias vu='vagrant up'
alias untar='tar xvf'
alias vssh='vagrant ssh'
alias fixvbox='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'
alias vsr='vs |grep running'
alias vbs='vagrant suspend'
alias vbr='vagrant resume'
alias ccat='pygmentize -g'
alias rlibmodule='export RUBYLIB="$(pwd)"/lib:$RUBYLIB'
alias serverme='mosh --server=/usr/bin/mosh-server serverbot'
alias be='bundle exec'
alias grph='git rev-parse HEAD'
alias de='dotenv'
alias gs='git status'
alias cleanprod='git fetch origin production && git checkout production && git reset --hard origin/production'

alias oa='open -a'
alias tr='gtr'
alias cut='gcut'
alias prune_puppet_branches="git branch | grep -v 'production' |grep -v -F '*' | xargs git branch -D"
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'

#vars
export EDITOR='vim'
export VAGRANT_DEFAULT_PROVIDER=virtualbox

if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

if [ -f /usr/local/bin/gsed ]; then
  alias fixlogs='gsed -r -i.bak "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
fi

# ruby -ryaml -e "YAML.load_file 'tst.yaml'"
validateyaml() {
  ruby -ryaml -rpuppet -e "YAML.load_file '$1'"
}

decryptfile() {
  gpg --decrypt $1 > $1.tar.gz
}

abt() {
  aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq .
}

findsubnet() {
  abt $1 | jq '.["Reservations"][0]["Instances"][0]["SubnetId"]'
}

findsecg() {
  abt $1 | jq '.["Reservations"][0]["Instances"][0]["SecurityGroups"]'
}

runon() {
  ssh $1 -- TERM=xterm $2
}

alias vgems='GEM_HOME=~/.vagrant.d/gems /Applications/Vagrant/embedded/bin/gem list'

set -o vi
alias crontab="VIM_CRONTAB=true crontab"
export WINEARCH=win32

if [ -e /home/zee/.local/bin/powerline-config ]; then
  export POWERLINE_CONFIG_COMMAND='/home/zee/.local/bin/powerline-config'
fi

[[ -s "/Users/zee/.gvm/scripts/gvm" ]] && source "/Users/zee/.gvm/scripts/gvm"
if [ -e /Users/zee/Library/Python/2.7/bin/powerline-config ]; then
  export POWERLINE_CONFIG_COMMAND='/Users/zee/Library/Python/2.7/bin/powerline-config'
fi

if [ -e ~/.zshrc_secret ]; then
  source ~/.zshrc_secret
fi

if [ -e ~/.zshrc_python ]; then
  source ~/.zshrc_python
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
