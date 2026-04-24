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

for file in ~/.config/zsh/*.zsh(N); do
    source "$file"
done


export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export EDITOR=nvim

# source <(opencode completion)
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
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:/usr/lib/emscripten/"
export CLASSPATH=/usr/share/java/mariadb-jdbc/mariadb-java-client.jar:.


# opencode
export PATH=/home/notarkhit/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
