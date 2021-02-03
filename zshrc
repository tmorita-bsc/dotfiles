#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Language
export LANG=ja_JP.UTF-8

# JAVA version
# old(1.6)
#export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.6")
# new(9.0)
export JAVA_HOME=""

# Pyenv # cant work .zshenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# 
# pipenv
# eval "$(pipenv --completion)"

# Application
# export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin":$PATH
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# npm
export PATH="/usr/local/share/npm/bin:$PATH"

# sphinx-doc
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

# TEX
export PATH="/Library/TeX/texbin:$PATH"
export TEXMFHOME="/Users/morita/texmf"

# GNU GLOBAL(gtags)
export GTAGSLABEL=pygments

# Move Command Line
#bindkey "^L" forward-word
#bindkey "^H" backward-word
#bindkey "^D" kill-word 
#bindkey "^@" clear-screen

# SetOpt
setopt auto_list
setopt extended_history
setopt hist_ignore_all_dups
setopt inc_append_history
setopt magic_equal_subst
setopt print_exit_value
#setopt auto_pushd
setopt no_share_history
#setopt auto_param_slash

# History
export HISTSIZE=10000
export SAVEHIST=10000
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# Autoload
#autoload -Uz compinit && compinit -u

# Alias
alias la="ls -a"

alias vim="nvim"

alias gs="git status"
alias ga="git add"
alias gp="git add -p"
alias gc="git commit -v"
alias gd="git diff --cached"

alias tmls="tmux ls"
alias tma="tmux a -t"
alias tmd="tmux d -t"
alias tmkill="tmux kill-session -t"

# dotfiles
#export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/usr/local/opt/curl/bin:/usr/local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# terminal font color
# https://geoff.greer.fm/lscolors/
# Default (LSCOLORS: MAC(BSD), LS_COLORS: Linux)
# LSCOLORS=exfxcxdxbxGxDxabagacad
# LS_COLORS=di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:
LSCOLORS=gxfxcxdxbxGxDxabagacad

# Zstyle
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/graphviz/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/graphviz/include"
