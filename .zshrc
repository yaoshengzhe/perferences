# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source ~/.bash_profile
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/Users/yao/.rvm/gems/ruby-1.9.3-p194/bin:/Users/yao/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/yao/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/yao/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/local/Cellar/hadoop/1.1.2/libexec/bin:/Users/yao/myLibrary/scala/scala-2.10.2/bin:

export JAVA_HOME="$(/usr/libexec/java_home)"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst=$dst"_`/bin/date +%Y-%b-%d-%H:%M:%S`"
      done
      /bin/mv "$path" ~/.Trash/"$dst"
    fi
  done
}

# automatically start emacs daemon
EMACS_SERVER_STATUS=`ps aux | grep "emacs --daemon" | wc -l | tr -d ' '`
if [ "$EMACS_SERVER_STATUS" = "1" ]; then
    erestart
fi
