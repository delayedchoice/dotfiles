# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

# Uncomment the following line to use case-sensitive completion.
; CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew catimg git git-extras git-flow git-prompt gitignore lein marked2 meteor node npm osx rvm sudo vim-interaction xcode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/bin:/Users/rharris/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Homebrew installed in home directory?
if [ -d $HOME/homebrew ]; then
  export PATH=$HOME/homebrew/bin:$PATH:$HOME/homebrew/opt/go/libexec/bin
else
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
fi

export GOPATH=$HOME/go

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export JAVA_OPTS="-Dapple.awt.UIElement=true"
export _JAVA_OPTIONS=$JAVA_OPTS

export JAVA5_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/
export JAVA6_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/ 
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/ 
export JAVA_HOME=$JAVA8_HOME

export DEVELOPER_CONFIG=~/Development/workspaces/gitaries/developer_config
export JBOSS_HOME=~/jboss
export GRADLE_OPTS="-Xmx1024m -XX:MaxPermSize=128m"
source `brew --prefix`/etc/profile.d/z.sh
# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
#export GHC_DOT_APP="/Users/rharris/Applications/ghc-7.10.1.app"
#if [ -d "$GHC_DOT_APP" ]; then
#    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
#fi
export http_proxy="http://proxy.jx.availity.net:8080"
export https_proxy="http://proxy.jx.availity.net:8080"
export no_proxy="localhost,127.0.0.1,localaddress,.local,.availity.net,.availity.com"