### Terminal & Shell
#### [Install Tilix](https://github.com/gnunn1/tilix)
 * `sudo apt install tilix`
 * Window Style: Disable CSD, hide toolbar
 * Terminal title style: None
 * Color scheme: Monokai Dark
 * Settings > Keyboard > Shortcuts > replace default `Ctrl+Alt+T` with custom shortcut for Tilix
 * Disable *Hide all normal windows* shortcut
 * Replace *Switch to next session* shortcut with `Ctrl+T`

#### [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
 1. Install Zsh
    * `sudo apt install zsh`
    * `chsh -s $(which zsh)`
    * `gnome-session-quit`
    * *Login*
    * `echo $SHELL`
 2. [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
    * `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
 3. [Spaceship Prompt](https://github.com/denysdovhan/spaceship-prompt)
    * `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"`
    * `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
 4. [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    * `echo "bindkey '^ ' autosuggest-accept" >> $ZSH_CUSTOM/autosuggestion-settings.zsh`
    * `source $ZSH_CUSTOM/autosuggestion-settings.zsh`
 5. [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
 6. Configure `.zshrc`
    * `curl -o ~/.zshrc https://raw.githubusercontent.com/utkuufuk/ubuntu-on-steroids/master/.zshrc`
    * `source ~/.zshrc`