# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/home/$USER/anaconda3/bin/:$PATH"
bindkey '^ ' autosuggest-accept
bindkey -s '^[g' "bash ~/.config/scripts/gitacp.sh^M"
bindkey -s '^[u' "bash ~/.config/scripts/update.sh^M"
bindkey -s '^[b' "systemctl --user restart pipewire pipewire-pulse wireplumber"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/.history
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

#Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

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
	source "/home/$USER/anaconda3/etc/profile.d/conda.sh" &> /dev/null
    if [[ ! -z $is_env ]]; then
        conda activate $current_dir_name &> /dev/null
     else
         conda activate latest
    fi
}

function nvm_init() {
	# source /usr/share/nvm/init-nvm.sh
	[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
	source /usr/share/nvm/init-nvm.sh
	# source /usr/share/nvm/nvm.sh
	# source /usr/share/nvm/install-nvm-exec
}

#setopt CORRECT_ALL

#aliases

alias zshconfig="mate ~/.zshrc"
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
alias ff="pokeget charizard --hide-name | fastfetch --file-raw -"
alias maria="mariadb --auto-rehash -u root -p"
alias spd="speedtest"
alias kcon="nvim ~/.config/kitty/kitty.conf"
alias tmuxx="tmux new-session -A -s"
# alias sl="sl;clear"
alias slurp="slurp -b 00000044 -c 333333ff"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source <(fzf --zsh)

export GPG_TTY=$(tty)
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

eval "$(zoxide init zsh)"
eval $(thefuck --alias)

if [[ ! -z $TMUX ]]; then
	activate_conda
fi

# source /usr/share/zsh/plugins/
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/notarkhit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/notarkhit/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/notarkhit/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/notarkhit/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

if [[ ! -z $TMUX ]]; then
	nvm_init
fi

export PATH="$PATH:$HOME/grimoire"
