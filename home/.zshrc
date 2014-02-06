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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby github git-remote-branch vi-mode vagrant zsh-syntax-highlighting vagrant)

source $ZSH/oh-my-zsh.sh

# Set general path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# Append rbenv stuff to path if it exists
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
fi

#options
bindkey -e
set -o vi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#aliases
alias tmux="tmux -2"
alias tns="tmux new -s"
alias ta="tmux attach"
alias tks='tmux kill-session -t'
alias decrypt='gpg -d'
alias 'gi'='gem install --no-ri --no-rdoc'
alias psp='pry --simple-prompt'
alias vrnp='vagrant reload --no-provision'
alias vunp='vagrant up --no-provision'
alias vs='vagrant status'
alias vu='vagrant up'
alias untar='tar xvf'
alias vssh='vagrant ssh'
alias fixvbox='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'
alias vsr='vs |grep running'

#vars
#
export HOMEBREW_GITHUB_API_TOKEN=d53e5f0eecea6ae32f1d5198fbfc13399298b7a8
export EDITOR='vim'

#magic
if [ -d /src/puppetlabs/puppet ]; then
  export ENVPUPPET_BASEDIR='/src/puppetlabs'
  eval $($ENVPUPPET_BASEDIR/puppet/ext/envpuppet)
  export PATH=/src/puppetlabs/facter:/src/puppetlabs/puppet:$PATH
fi

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

showtickets() {
  cwd=$(pwd)
  cd ~/Dropbox/Projects/Personal/Zendeath
  ./zendeath.rb myworking
  cd $cwd
}

alias vgems='GEM_HOME=~/.vagrant.d/gems /Applications/Vagrant/embedded/bin/gem list'
