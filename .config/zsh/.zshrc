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


# Fix zsh vi and syntax incompatability
function zvm_after_init() {
  autoload add-zle-hook-widget
  add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}

# zshmarks commands
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"



# Self-created functions

## 
alias vim="nvim"

## Search in Google etc.

google()
{
	url_search="${@}"
	search_formatted="${url_search// /+}"
	firefox -new-window "https://www.google.com/search?q=$search_formatted"
}





# Syntax highlighting should be last sourced
znap source zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
