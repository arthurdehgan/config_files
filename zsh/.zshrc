#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/home/arthur/.local/bin
export LANG=en_US.UTF-8
alias maj="sudo pacman -Syu"
alias ml='source /home/arthur/.pyvenvs/ml/bin/activate'
export WORK="arthur@work_address"
export GUILLIMIN="kikuko@guillimin.hpc.mcgill.ca"
alias work="ssh $WORK"
alias workX="ssh -X $WORK"
alias guillimin="ssh $GUILLIMIN"
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
