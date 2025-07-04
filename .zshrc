# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="/home/$USER/anaconda3/bin/:$PATH"
bindkey '^ ' autosuggest-accept
bindkey -s '^[g' "bash ~/.config/scripts/gitacp.sh^M"
bindkey -s '^[u' "bash ~/.config/scripts/update.sh^M"
bindkey -s '^[b' "systemctl --user restart pipewire pipewire-pulse wireplumber"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/.history
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"

 zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	git 
	zsh-syntax-highlighting 
    zsh-autosuggestions
)

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
#
# #preexec
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
alias tmux="tmux new-session -A -s"
# alias sl="sl;clear"
alias slurp="slurp -b 00000044 -c 333333ff"
alias anime="ani-cli"

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
