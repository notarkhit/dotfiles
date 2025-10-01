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

plugins=(
	git 
	zsh-syntax-highlighting 
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -z $DISPLAY && $TERM == linux ]]; then
  [[ -r ~/.p10k.zsh.tty ]] && source ~/.p10k.zsh.tty
else
  [[ -r ~/.p10k.zsh.gui ]] && source ~/.p10k.zsh.gui
fi

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
         conda activate base
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
alias tmx="tmux new-session -A -s"
alias slurp="slurp -b 00000044 -c 333333ff"
alias anime="ani-cli"
alias kys="poweroff"
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"
alias code="nvim"
alias emacs="nvim"
alias ow="sudo pacman -S --overwrite '*'"
alias music="ncmpcpp"
alias gitstat="git --no-pager diff --stat"


#console colors
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color=auto"

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

source <(fzf --zsh)
export GPG_TTY=$(tty)
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

if [[ ! -z $TMUX ]]; then
	
	session_name=$(tmux display-message -p '#S')

	if [[ $session_name =~ (py|python|ml|machine-learning|ai|conda|venv) ]]; then
		activate_conda
	fi

	if [[ $session_name =~ (javascript|html|css|web|webdev|js|node|nodejs|react|angular|frontend|backend) ]]; then
		nvm_init
		# Load Angular CLI autocompletion.
		source <(ng completion script)
	fi
fi


export PATH="$PATH:$HOME/grimoire"
export CLASSPATH=/usr/share/java/mariadb-jdbc/mariadb-java-client.jar:.

