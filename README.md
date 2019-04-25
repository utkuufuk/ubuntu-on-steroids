# Ubuntu on Steroids
### Dependencies
 * `sudo apt install python-dev`
 * `sudo apt install python3-dev`
 * `sudo apt install libssl-dev`
 * `sudo apt install curl`
 * `sudo apt install cmake`
 * `sudo apt install default-jdk`
 * `sudo apt install python3-pip`
 * `sudo apt install python3-tk` *(optional)*
 * `sudo apt install python3-bs4` *(optional)*
 * `sudo pip3 install matplotlib` *(optional)*

### Standard Tools
 | Tool | Description |
 |:-|:-|
 | Keepass2 | `sudo apt install keepass2` |
 | Dropbox | Ubuntu Software |
 | Open Drive | Ubuntu Software |
 | Spotify | Ubuntu Software |
 | GIMP | Ubuntu Software |
 | Nvidia Driver | *Software & Updates > Additional Drivers* |
 | Desktop Slideshow | *Shotwell Photo Manager > Select Pictures > File > Set as Desktop Slideshow* |
 | [Git & Github](https://help.github.com/articles/connecting-to-github-with-ssh/) | <ol><li>`sudo apt install git` <li> `https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/` <li> `https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/` |
 | [Fonts](https://github.com/powerline/fonts) | <ol><li>[Input Fonts](http://input.fontbureau.com/download/index.html?size=14&language=python&theme=monokai&family=InputMono&width=400&weight=400&line-height=1.3&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=height&braces=0&preset=default&customize=please)<li>Powerline Fonts<ol><li>`git clone https://github.com/powerline/fonts.git --depth=1` <li> `cd fonts` <li> `./install.sh` <li> `cd ..` <li> `rm -rf fonts` |
 | Gnome Theme | <ol><li> `sudo add-apt-repository -u ppa:snwh/ppa` <li> `sudo apt update` <li> `sudo apt install paper-icon-theme` <li> `sudo apt install gnome-tweak-tool` <li> *Tweaks > Appearance > Applications > Adwaita-dark* <li> *Tweaks > Appearance > Icons > Paper* |

### Vim
 | Tool | Description |
 |:-|:-|
 | [Neovim](https://github.com/neovim/neovim) | <ol><li> `sudo apt install neovim` <li> `curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/utkuufuk/vim-cheatsheet/master/init.vim` |
 | [Vim-Plug](https://github.com/junegunn/vim-plug) | `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` |
 | [Vim Markdown Composer](https://github.com/euclio/vim-markdown-composer) | `curl https://sh.rustup.rs -sSf \| sh`  |
 | [Vimtex](https://github.com/lervag/vimtex) | <ol><li> `sudo apt install latexmk` <li> `sudo apt install texlive` <li> `sudo apt install texlive-latex-extra` <li> `mkdir ~/texmf` <li> `mkdir ~/texmf/tex` <li> Place the `.sty` files inside `tex` folder. |
  | Install Plugins | <ol><li> `vim ~/.config/nvim/init.vim` <li> `:PlugInstall` |

### Node.js
[Install & Configure Node.js](nodejs.md)

### Terminal
 | Tool | Description |
 |:-|:-|
 | [Tilix](https://github.com/gnunn1/tilix) | <ol><li>`sudo apt install tilix`<li>Window Style: Disable CSD, hide toolbar<li>Terminal title style: None<li>Color scheme: Monokai Dark<li>Settings > Keyboard > Shortcuts > replace default `Ctrl+Alt+T` with custom shortcut for Tilix<li>Disable *Hide all normal windows* shortcut<li>Replace *Switch to next session* shortcut with `Ctrl+T` |
 | [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) | <ol><li> `sudo apt install zsh` <li> `chsh -s $(which zsh)` <li> `gnome-session-quit` <li> *Relog* <li> `echo $SHELL` |
 | [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` |
 | [Spaceship Prompt](https://github.com/denysdovhan/spaceship-prompt) | <ol><li> `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"` <li> `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"` <li> `.zshrc` > `ZSH_THEME="spaceship"` <li> `source ~/.zshrc` |
 | [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | <ol><li> `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` <li> `.zshrc > plugins=(zsh-autosuggestions)` <li> `echo "bindkey '^ ' autosuggest-accept" >> $ZSH_CUSTOM/autosuggestion-settings.zsh` <li> `source ~/.zshrc` <li> `source $ZSH_CUSTOM/autosuggestion-settings.zsh` |
 | [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | <ol><li> `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` <li> `.zshrc > plugins=(zsh-syntax-highlighting)` <li> `source ~/.zshrc` |
  | Default Editor | <ol><li> `.zshrc > export EDITOR=/usr/bin/vim` <li> `source ~/.zshrc` |
  | **PATH** | <ol><li> `.zshrc > export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.node_modules_global/bin:$PATH"` <li> `source ~/.zshrc` |

### [Visual Studio Code](https://code.visualstudio.com/)
 1. [Download the .deb package](https://code.visualstudio.com/docs/?dv=linux64_deb) 
 2. Download Extensions: 
    * Vim 
    * Python
    * ESLint
    * Prettier
    * Dracula Ofiicial
    * Live Server
    * ES7 React/Redux/GraphQL/React-Native snippets
    * REST Client
    * GitLens
    * Material Icon Theme
 3. Copy the [User Settings](vscode.settings.json) into `settings.json`
 4. `Ctrl+Shift+P > Python: Select Interpreter > Python 3.X`
 5. `npm install -g eslint`

### Other
 | Tool | Description |
 |:-|:-|
 | [Trello-Cli](https://github.com/mheap/trello-cli) | <ol><li> `sudo npm i trello-cli -g` <li> Configure: https://www.npmjs.com/package/trello-cli <li> `.zshrc > addcard(){trello add-card -b "Tasks" -l "Inbox" $1}` <li> `source ~/.zshrc` <li> `trello refresh` |
 | [Hexo](https://github.com/hexojs/hexo) | <ol><li> `sudo npm i hexo-cli -g` <li> `cd /your/hexo/project` <li> `npm install` |
 | [Peek](https://github.com/phw/peek) | <ol><li> `sudo add-apt-repository ppa:peek-developers/stable` <li> `sudo apt update` <li> `sudo apt install peek` |
 | [ag](https://github.com/ggreer/the_silver_searcher) / [sack](https://github.com/sampson-chen/sack) | <ol><li> `sudo apt install silversearcher-ag` <li> `git clone https://github.com/sampson-chen/sack.git` <li> `cd sack` <li> `chmod +x install_sack.sh` <li> `./install_sack.sh` <li> `cd ..` <li> `rm -rf sack` |
