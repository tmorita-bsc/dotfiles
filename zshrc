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

# Pyenv # cant work .zshenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# GNU GLOBAL(gtags)
export GTAGSLABEL=pygments

# Move Command Line
bindkey "^L" forward-word
bindkey "^H" backward-word
bindkey "^D" kill-word 
bindkey "^@" clear-screen

# SetOpt
setopt auto_list
setopt extended_history
setopt hist_ignore_all_dups
setopt inc_append_history
setopt magic_equal_subst
setopt print_exit_value
setopt auto_pushd
setopt share_history
setopt auto_param_slash

# History
export HISTSIZE=1000000
export SAVEHIST=1000000
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# Autoload
autoload -Uz compinit && compinit -u

# Env Parameters
#export PATH="/usr/local/opt/curl/bin:$PATH"
#export XDG_CONFIG_HOME="$HOME/.config"
## Pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

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
