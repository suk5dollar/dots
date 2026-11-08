[[ -n $PS1 ]] || return

HISTCONTROL='ignoredups'
HISTSIZE=5000
HISTFILESIZE=5000

export TERM='tmux-256color'
export COLORTERM='truecolor'
export EDITOR='vim'
export SUDO_EDITOR='vim'
export VISUAL='vim'
export MANPAGER='less'
export PAGER='less'

export PATH="$HOME/.local/bin:$PATH"
PATH=$(printf "%s" "$PATH" | \
  awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

shopt -s cdspell
shopt -s checkwinsize
shopt -s extglob
shopt -s autocd
shopt -s dirspell

alias c='clear'
alias ls='ls -CF --color=auto --group-directories-first'
alias la='ls -CFA'
alias l='ls -lhF'
alias ll='ls -lhFA'
alias grep='grep --color=auto'

force_color_prompt=yes
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


