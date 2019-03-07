# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
#export PATH="$PATH:$HOME/Dev/brew/bin"
#export PATH="$PATH:$HOME/Dev/brew/sbin"
export HOMEBREW_NO_ANALYTICS=1.
 #Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew catimg git git-extras git-flow git-prompt gitignore lein marked2 meteor node npm osx rvm sudo vim-interaction xcode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

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
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

function connect_adb() {
	/home/bobbyharris/dev/android/sdk/platform-tools/adb connect 100.115.92.2:5555
}

export VISUAL="nvim"
export EDITOR="$VISUAL"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export ANDROID_HOME=/home/bobbyharris/dev/android/sdk
export PATH="$PATH:$HOME/.yarn/bin:$HOME/bin:$ANDROID_HOME/platform-tools"
eval "$(pyenv init -)"
export TERM="screen-256color"
