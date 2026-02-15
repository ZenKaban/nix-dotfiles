# Launch on terminal start
fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
# export PATH=$PATH:~/.fzf/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export MANPAGER='nvim +Man!'
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export YT_PROXY=hahn

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
plugins+=(
    git
    zsh-vi-mode
    # pyenv
    # poetry
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Aliases
alias ls='eza -l'
alias lss='eza -l --sort=modified'
alias v='nvim'
alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    if [ "$HOST" = "nixos" ]; then
        alias config='/run/current-system/sw/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    else
        alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    fi
alias lazygitconfig='lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
alias fgrep='~/.config/scripts/fzrg'
alias kcp='kitten clipboard'
alias cl='clear;fastfetch'
if [ "$HOST" != "arch" ] && [ "$HOST" != "nixos" ]; then
    alias ya='/home/kabanov-alex/.local/bin/ya'
fi

### Functions 
# Update dotfiles
function config-upd() {
   config pull && config add -u && config status && config commit -m "$1" && config push
}


function sysupd() {
    if [ "$HOST" != "arch" ]; then
        sudo apt update --allow-insecure-repositories && sudo apt upgrade && brew update && brew upgrade && flatpak update
    else
        yay
    fi
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

### Evals
if [ "$HOST" != "arch" ] && [ "$HOST" != "nixos" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# if [ "$HOST" != "arch" ] && [ "$HOST" != "nixos" ]; then
#     source /home/kabanov-alex/.yql/shell_completion
# fi

eval "$(zoxide init zsh)"

# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
zvm_after_init_commands+=('source <(fzf --zsh)')
source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme
eval $(skotty ssh env)
