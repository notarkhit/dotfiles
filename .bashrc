#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


eval "$(starship init bash)"
eval "$(zoxide init bash)"


function nvm_init() {
	# source /usr/share/nvm/init-nvm.sh
	[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
	source /usr/share/nvm/nvm.sh
	source /usr/share/nvm/install-nvm-exec
}


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/notarkhit/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/notarkhit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/notarkhit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/notarkhit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

nvm_init
