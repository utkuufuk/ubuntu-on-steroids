# Ubuntu on Steroids
### Dependencies
 * `sudo apt install python-dev`
 * `sudo apt install python3-dev`
 * `sudo apt install libssl-dev`
 * `sudo apt install curl`
 * `sudo apt install cmake`
 * `sudo apt install nodejs`
 * `sudo apt install npm`
 * `sudo apt install python3-pip`
 * `sudo apt install python3-tk` *(optional)*
 * `sudo apt install python3-bs4` *(optional)*
 * `sudo pip3 install matplotlib` *(optional)*

### Go
 1. `sudo add-apt-repository ppa:longsleep/golang-backports`
 2. `sudo apt-get update`
 3. `sudo apt-get install golang-go`
 4. Add the following lines to `.zshrc:`
    * `export GOPATH=$HOME/go`
    * `export PATH=$PATH:$GOROOT/bin:$GOPATH/bin`

### Standard Tools
 | Tool | Description |
 |:-|:-|
 | Keepass2 | `sudo apt install keepass2` |
 | Dropbox | Ubuntu Software |
 | Open Drive | Ubuntu Software |
 | Spotify | Ubuntu Software |
 | Pinta | Ubuntu Software |
 | Nvidia Driver | *Software & Updates > Additional Drivers* |
 | Desktop Slideshow | *Shotwell Photo Manager > Select Pictures > File > Set as Desktop Slideshow* |
 | [Git & Github](https://help.github.com/articles/connecting-to-github-with-ssh/) | <ol><li>`sudo apt install git` <li> https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/ <li> https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/ |
 | [Powerline Fonts](https://github.com/powerline/fonts) | <ol><li>`git clone https://github.com/powerline/fonts.git --depth=1` <li> `cd fonts` <li> `./install.sh` <li> `cd ..` <li> `rm -rf fonts` |
 | Gnome Theme | <ol><li> `sudo add-apt-repository -u ppa:snwh/ppa` <li> `sudo apt update` <li> `sudo apt install paper-icon-theme` <li> `sudo apt install gnome-tweak-tool` <li> *Tweaks > Appearance > Applications > Adwaita-dark* <li> *Tweaks > Appearance > Icons > Paper* |

### Vim
 | Tool | Description |
 |:-|:-|
 | [Neovim](https://github.com/neovim/neovim) | <ol><li> `sudo apt install neovim` <li> `curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/utkuufuk/vim-cheatsheet/master/init.vim` |
 | [Vim-Plug](https://github.com/junegunn/vim-plug) | `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` |
 | [Vim Markdown Composer](https://github.com/euclio/vim-markdown-composer) | `curl https://sh.rustup.rs -sSf \| sh`  |
 | [Vimtex](https://github.com/lervag/vimtex) | <ol><li> `sudo apt install latexmk` <li> `sudo apt install texlive` <li> `sudo apt install texlive-latex-extra` <li> `mkdir ~/texmf` <li> `mkdir ~/texmf/tex` <li> Place the `.sty` files inside `tex` folder. |
 | [Ale](https://github.com/w0rp/ale) | <ol><li> `mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start` <li> `git clone https://github.com/w0rp/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale` |

### Terminal
 | Tool | Description |
 |:-|:-|
 | [Tilix](https://github.com/gnunn1/tilix) | <ol><li> `sudo apt install tilix` <li> https://gnunn1.github.io/tilix-web/manual/vteconfig/ <li> *Keyboard > Keyboard Shortcuts > Add Tilix Shortcut* |
 | [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) | <ol><li> `sudo apt install zsh` <li> `chsh -s $(which zsh)` <li> `gnome-session-quit` <li> *Relog* <li> `echo $SHELL` |
 | [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` |
 | [Spaceship Propmpt](https://github.com/denysdovhan/spaceship-prompt) | <ol><li> `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"` <li> `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"` <li> `.zshrc` > `ZSH_THEME="spaceship"` <li> `source ~/.zshrc` |
 | [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | <ol><li> `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` <li> `.zshrc > plugins=(zsh-autosuggestions)` <li> `echo "bindkey '^ ' autosuggest-accept" >> $ZSH_CUSTOM/autosuggestion-settings.zsh` <li> `source ~/.zshrc` <li> `source $ZSH_CUSTOM/autosuggestion-settings.zsh` |
 | [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | <ol><li> `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` <li> `.zshrc > plugins=(zsh-syntax-highlighting)` <li> `source ~/.zshrc` |

### Other
 | Tool | Description |
 |:-|:-|
 | [Visual Studio Code](https://code.visualstudio.com/) | <ol><li> [Download the .deb package](https://code.visualstudio.com/docs/?dv=linux64_deb) <li> Download Extensions: <ul><li> Vim <li> Python <li> ESLint <li> LaTeX Workshop </ul> <li> Copy the [User Settings](vscodevim_user.json) into `settings.json` <li> `Ctrl+Shift+P > Python: Select Interpreter > Python 3.X` </ol>|
 | [s](https://github.com/zquestz/s) | <ol><li> `go get -v github.com/zquestz/s` <li> `cd $GOPATH/src/github.com/zquestz/s` <li> `make` <li> `make install` </ol>|
 | [Trello-Cli](https://github.com/mheap/trello-cli) | <ol><li> `sudo npm i trello-cli -g` <li> Configure: https://www.npmjs.com/package/trello-cli <li> `.zshrc > addcard(){trello add-card -b "Tasks" -l "Inbox" $1}` <li> `source ~/.zshrc` <li> `trello refresh` |
 | [Hexo](https://github.com/hexojs/hexo) | <ol><li> `sudo npm i hexo-cli -g` <li> `cd /your/hexo/project` <li> `npm install` |
 | [Peek](https://github.com/phw/peek) | <ol><li> `sudo add-apt-repository ppa:peek-developers/stable` <li> `sudo apt update` <li> `sudo apt install peek` |

### Bonus: Keyboard Shortcuts
| Shortcut | Description |
|:--|:--|
| `Super+D or Ctrl+Alt+D` | Show Desktop |
| `Ctrl+Alt+Arrow` | Move Between Workspaces |
| `Super+Arrow` | Snap Window |
| `Alt+F2` | Run Command |
