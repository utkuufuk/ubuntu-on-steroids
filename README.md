# Ubuntu on Steroids
## Table of Contents
 1. [Core Dependencies](#core-dependencies)
 2. [Basic Tools](#basic-tools)
 3. [Neovim](#neovim)
 4. [Node.js](#nodejs)
 5. [Terminal & Shell](#terminal-&-shell)
 6. [Visual Studio Code](#visual-studio-code)
 7. [Misc](#misc)

## Core Dependencies
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

## Basic Tools
#### KeePass 
> `sudo apt install keepass2`

#### Ubuntu Software
 * Dropbox 
 * Spotify
 * GIMP

#### Nvidia Driver
> *Software & Updates > Additional Drivers*

#### Desktop Slideshow
> *Shotwell Photo Manager > Select Pictures > File > Set as Desktop Slideshow* |

#### [Git & Github](https://help.github.com/articles/connecting-to-github-with-ssh/)
 1. `sudo apt install git`
 2. [Generate SSH Key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
 3. [Add SSH Key to Github Account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

#### Fonts
 1. [Input Fonts](http://input.fontbureau.com/download/index.html?size=14&language=python&theme=monokai&family=InputMono&width=400&weight=400&line-height=1.3&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=height&braces=0&preset=default&customize=please)
  2. Powerline Fonts
     * `git clone https://github.com/powerline/fonts.git --depth=1`
     * `cd fonts`
     * `./install.sh`
     * `cd ..`
     * `rm -rf fonts`

#### Gnome Theme
  * `sudo add-apt-repository -u ppa:snwh/ppa`
  * `sudo apt update`
  * `sudo apt install paper-icon-theme`
  * `sudo apt install gnome-tweak-tool`
  * *Tweaks > Appearance > Applications > Adwaita-dark*
  * *Tweaks > Appearance > Icons > Paper*

## Neovim
 1. [Install Neovim](https://github.com/neovim/neovim)
    1. `sudo apt install neovim`
    2. `curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/utkuufuk/ubuntu-on-steroids/master/init.vim`

 2. [Install Vim-Plug](https://github.com/junegunn/vim-plug)
    > `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

 3. Install Plugins
    1. [Vim Markdown Composer](https://github.com/euclio/vim-markdown-composer)
        * `curl https://sh.rustup.rs -sSf \| sh`
    2. [Vimtex](https://github.com/lervag/vimtex)
        * `sudo apt install latexmk`
        * `sudo apt install texlive`
        * `sudo apt install texlive-latex-extra`
        * `mkdir ~/texmf`
        * `mkdir ~/texmf/tex`
        * Place all `.sty` files inside `tex` folder.
    3. Activate Plugins
        * `vim ~/.config/nvim/init.vim`
        * `:PlugInstall`

## Node.js
### Installation
#### Install Node.js
 ```sh
 # install nodejs 11
 curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
 sudo apt install -y nodejs
 ```

#### Change the Location of Global Packages
 1. `cd ~ && mkdir .node_modules_global`
 2. `npm config set prefix=$HOME/.node_modules_global`
 3. `npm install npm@latest -g`

#### Update Npm
 ```sh
 npm install npm@latest -g 
 npm rebuild
 ```

#### Configure Defaults
 ```sh
 npm config set init.author.name <name>
 npm config set init.author.email <email>
 ```

### Useful Commands
For applicable commands below, add `-g` for *global* packages.

| Command               | Description                           |
|:----------------------|:--------------------------------------|
| `npm ls --depth=0`    | List installed packages               |
| `npm outdated`        | List outdated packages                |
| `npm dedupe`          | Reduce duplication in package tree    |
| `npm prune`           | Remove extraneous packages            |

### `package.json`
[Configuring package.json](https://docs.npmjs.com/files/package.json)

## Terminal & Shell
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

## Visual Studio Code
 1. [Download the .deb package](https://code.visualstudio.com/docs/?dv=linux64_deb) 
 2. Download Extensions
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
 3. Copy the [settings file](vscode.settings.json) contents into `settings.json`
 4. `Ctrl+Shift+P > Python: Select Interpreter > Python 3.X`
 5. `npm install -g eslint`

## Misc
 * [Peek](https://github.com/phw/peek)
    * `sudo add-apt-repository ppa:peek-developers/stable`
    * `sudo apt update`
    * `sudo apt install peek`
 * [ag](https://github.com/ggreer/the_silver_searcher) & [sack](https://github.com/sampson-chen/sack)
    * `sudo apt install silversearcher-ag`
    * `git clone https://github.com/sampson-chen/sack.git`
    * `cd sack`
    * `chmod +x install_sack.sh`
    * `./install_sack.sh`
    * `cd ..`
    * `rm -rf sack`