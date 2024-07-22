Installation
------------

Install oh-my-posh (source: https://ohmyposh.dev/)

  1. Download and install

     ```bash
     curl -s https://ohmyposh.dev/install.sh | bash -s
     ```

  3. Copy configuration file to .config folder 

     ```bash
     d="$HOME/.config/ohmyposh/"
     mkdir -p "$d" && cp config.toml "$d" 
     ```

  2. Make sure you set up .zshrc correctly afterwards by adding:

     ```bash
     echo 'eval "$(oh-my-posh init zsh)"' >> $HOME/.zshrc
     echo 'eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"' >> $HOME/.zshrc
     ```
