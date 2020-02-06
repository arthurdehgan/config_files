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

  6. activate and run follow instruction for powerline10k theme

    ```console
    prompt powerline10k
    ```

