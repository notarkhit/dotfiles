if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/home/$USER/anaconda3/bin/:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

plugins=(
  git
  zsh-autosuggestions
  #syntax highlighting must be last
  zsh-syntax-highlighting
)
bindkey '^ ' autosuggest-accept
bindkey -s '^[g' "bash ~/.config/scripts/gitacp.sh^M"
bindkey -s '^[u' "bash ~/.config/scripts/update.sh^M"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

#preexec
# PreExec-Funcitons:
function preexec(){
    if [[ "$1" == *"--help"* ]]; then
        help=$(eval "$1")
        if [ ! -z "$help" ]; then
            echo "$help" | less
        else
            echo "$help"
        fi
        return 0
    fi
}

# yazi shell wrapper

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# conda activation
function activate_conda() {
    local current_dir_name=$(basename "$PWD")
    local is_env=$(awk -F/ -v name="$current_dir_name" '$NF == name {print $NF}' ~/.conda/environments.txt )

    if [[ ! -z $is_env ]]; then
        source "/home/$USER/anaconda3/etc/profile.d/conda.sh" &> /dev/null
        conda activate $current_dir_name &> /dev/null
    # else
    #     conda activate $CONDA_DEFAULT_ENV
    fi
}

eval $(thefuck --alias)


#setopt CORRECT_ALL

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias CLEAR="clear"
alias lf="yazi"
alias ranger="yazi"
alias hconf="nvim ~/.config/hypr/hyprland.conf"
alias cat="bat"
alias nvfix="rm ~/.local/share/nvim -rf && rm ~/.local/state/nvim -rf"
alias tt="toipe"
alias cd="z"
alias ls="eza --icons always --hyperlink"
alias lsl="eza --icons always --total-size --hyperlink -l"
alias asdf="exit"
alias rc="nvim ~/.zshrc"
alias pacss="pacman -Ss"
alias ff="fastfetch"
alias maria="mariadb --auto-rehash -u root -p"
alias spd="speedtest"
alias kcon="nvim ~/.config/kitty/kitty.conf"
alias tmuxx="tmux new-session -A -s"
alias sl="sl;clear"
alias slurp="slurp -b 00000044 -c 333333ff"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source <(fzf --zsh)

export GPG_TTY=$(tty)
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

eval "$(zoxide init zsh)"

if [[ ! -z $TMUX ]]; then
	activate_conda
fi
