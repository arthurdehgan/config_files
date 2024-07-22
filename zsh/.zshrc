source $HOME/.zprofile

# ---- oh-my-posh ----
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

# ---- Zoxide ----
eval "$(zoxide init zsh)"

# ---- FZF -----
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# eza bat fzf integration
# show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# fzf theme 
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# ---- Bat (better cat) ----
export BAT_THEME=tokyonight_night

# ---- Improve $PATH ----
export PATH=$PATH:$HOME/.local/bin

# ---- aliases ----
alias cat="bat"
alias ls="eza --color=always --grid --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias vi="/usr/bin/vim"
alias vim="nvim"

# ---- server setups ----
export MP2="kikuko@mp2b.calculquebec.ca"
export GRAHAM="kikuko@graham.computecanada.ca"
export GUILLIMIN="kikuko@guillimin.hpc.mcgill.ca"
export WORK="arthur@work_address" # Need to add work PC adress to hosts
export PERSO="arthur@perso_address" # Need to add personal PC adress to hosts
alias mp2="ssh $MP2"
alias graham="ssh $GRAHAM"
alias guillimin="ssh $GUILLIMIN"
alias work="ssh $WORK"
alias perso="ssh $PERSO"

# Disable globbing on the remote path.
alias scp='noglob scp_wrap'
function scp_wrap {
	  local -a args
	    local i
	      for i in "$@"; do case $i in
		          (*:*) args+=($i) ;;
			      (*) args+=(${~i}) ;;
			        esac; done
				  command scp "${(@)args}"
			  }
			  
# Disable globbing on the remote path.
alias rsync='noglob rsync_wrap'
function rsync_wrap {
	  local -a args
	    local i
	      for i in "$@"; do case $i in
		          (*:*) args+=($i) ;;
			      (*) args+=(${~i}) ;;
			        esac; done
				  command rsync "${(@)args}"
			  }

