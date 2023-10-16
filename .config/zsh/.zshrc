export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Download Znap, if it's not there yet.
[[ -r $ZDOTDIR/zsh_plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZDOTDIR/zsh_plugins/znap

source $ZDOTDIR/zsh_plugins/znap/znap.zsh  # Start Znap

znap source jeffreytse/zsh-vi-mode
znap source jocelynmallon/zshmarks
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions

# Fix zsh vi and syntax incompatability
## If not, will cause trouble with other keybinds
function zvm_after_init() {
  autoload add-zle-hook-widget
  add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}
bindkey -v
export KEYTIMEOUT=1

# zshmarks commands
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"


# Completion
autoload -U compinit; compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'r:|.=*'

## Vim Keys for Tab Completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@" 
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Self-created functions

## 
alias vim="nvim"
alias hypr="nvim ~/.config/hypr/hyprland.conf"
#alias jp="pkill jupyter ; sleep 0.5 && nohup jupyter lab| sleep 0.1 && exit"
#alias jp="pkill jupyter ; (coproc nohup jupyter lab ; sleep 0.1 && exit && exit && exit)"
alias jp="pkill jupyter ; (nohup jupyter lab --notebook-dir ~/Desktop/Coding & exit) ; exit"
alias c="cheat"
alias zshrc="nvim ~/.config/zsh/.zshrc"

## Search in Google etc.

ggl()
{
	url_search="${@}"
	search_formatted="${url_search// /+}"
	firefox -new-window "https://www.google.com/search?q=$search_formatted"
}


bindkey -s "^o" "lfcd\n"

# Syntax highlighting should be last sourced
znap source zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
