
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

function rcv() {
	while [[ $(ls ~/.local/share/Trash/files/ | wc -l) -ne 0  ]]; do trash-restore ; done
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

function yank() {
	if [[ $# -ne 1 ]];then
		echo "Please provide 1 arguement"
	else
		cat $1 | wl-copy
	fi
}


function yeet() {
	if [[ $# -ne 1 ]];then
		echo "Please provide 1 arguement"
	else
		wl-paste >> $1
	fi
}

