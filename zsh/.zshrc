# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/home/arthur/.local/bin
export LANG=en_US.UTF-8
alias vi="/usr/bin/vim"
alias vim="nvim"

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
export MP2="kikuko@mp2b.calculquebec.ca"
alias mp2="ssh $MP2"
export GRAHAM="kikuko@graham.computecanada.ca"
alias graham="ssh $GRAHAM"
export WORK="arthur@work_address"
export GUILLIMIN="kikuko@guillimin.hpc.mcgill.ca"
alias guillimin="ssh $GUILLIMIN"
alias work="ssh $WORK"
alias workX="ssh -X $WORK"

# For pyenv to work
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
