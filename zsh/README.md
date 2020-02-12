Installation
------------

Prezto will work with any recent release of Zsh, but the minimum required
version is 4.3.11.

  1. Launch Zsh:

     ```console
     zsh
     ```

  2. Clone the repository:

     ```console
     git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
     ```

  3. Create a new Zsh configuration by copying the Zsh configuration files
     provided:

     ```sh
     setopt EXTENDED_GLOB
     for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
       ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
     done
     ```

     Note: If you already have any of the given configuration files, `ln` will
     cause error. In simple cases you can load prezto by adding the line
     `source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"` to the bottom of your
     `.zshrc` and keep the rest of your Zsh configuration intact. For more
     complicated setups, it is recommended that you back up your original
     configs and replace them with the provided prezto runcoms.

  4. Set Zsh as your default shell:

     ```console
     chsh -s /bin/zsh
     ```

  5. copy zshrc file in the home folder

     ```console
     cp .zshrc ~/
     ```

  6. copy powerlevel10k settings and add to .zshrc the config for powerlevel10k to run:

     ```console
     cp .p10k.zsh $HOME/
     sed -i "1i# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.\n# Initialization code that may require console input (password prompts, [y/n]\n# confirmations, etc.) must go above this block, everything else may go below.\nif [[ -r '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh' ]]; then\nsource '${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh'\nfi\n" $HOME/.zshrc
     printf "\nprompt powerlevel10k\n\n# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.\n[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc
     ```

