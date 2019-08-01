# Ubuntu on Steroids
### Table of Contents
 1. [Core Dependencies](#core-dependencies)
 2. [Common Tools & Drivers](#common-tools--drivers)
 3. [Git & Github](#git--github)
 4. [Theme](#theme)
 5. [Neovim](#neovim)
 6. [Node.js](#nodejs)
 7. [Terminal & Shell](#terminal--shell)
 8. [Visual Studio Code](#visual-studio-code)
 9. [Other Tools](#other-tools)
 10. [Docker](#docker)
 11. [MySQL](#mysql)
 12. [DigitalOcean](#digitalocean)
 13. [Useful Commands](#useful-commands)

### Core Dependencies
 * `sudo apt install python-dev`
 * `sudo apt install python3-dev`
 * `sudo apt install libssl-dev`
 * `sudo apt install curl`
 * `sudo apt install cmake`
 * `sudo apt install default-jdk`
 * `sudo apt install maven`
 * `sudo apt install python3-pip`
 * `sudo apt install python3-tk`
<br>

### Common Tools & Drivers
#### Nvidia Driver
> *Software & Updates > Additional Drivers*

#### KeePass 
``` sh
sudo apt install keepass2
```

#### OBS
``` sh
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio
```

#### Skype
``` sh
wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb
rm skypeforlinux-64.deb
```

#### Ubuntu Software
 * Dropbox 
 * Spotify
 * GIMP

<br>

### Git & Github
#### Install Git & Configure SSH
 1. `sudo apt install git`
 2. [Generate SSH Key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
 3. [Add SSH Key to Github Account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

#### [Gitbatch](https://github.com/isacikgoz/gitbatch)
``` sh
# lines 1, 2 and 4 must be modified for newer versions
curl -OL https://github.com/isacikgoz/gitbatch/releases/download/v0.4.2/gitbatch_0.4.1_linux_amd64.tar.gz
tar xzf gitbatch_0.4.2_linux_amd64.tar.gz
mv gitbatch ~/bin
rm gitbatch_0.4.2_linux_amd64.tar.gz
```

#### [Oh My Repos](https://github.com/utkuufuk/oh-my-repos)
 1. `sudo apt install myrepos`
 2. `git clone https://github.com/utkuufuk/oh-my-repos`
 3. `pip3 install oh-my-repos/.`
 4. `rm -rf oh-my-repos`

<br>

### Theme
#### Fonts
 1. [Hack](https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip)
 2. [Courier Prime Code](https://www.fontsquirrel.com/fonts/courier-prime-code)
 3. [Input](http://input.fontbureau.com/download/index.html?size=15&language=python&theme=monokai&family=InputMono&width=300&weight=400&line-height=1.3&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=height&braces=0&preset=default&customize=please)
 4. Source Code Pro
    ``` sh
    # download & install Source Code Pro
    git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
    fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
    ```

#### Gnome Theme
  * `sudo add-apt-repository -u ppa:snwh/ppa`
  * `sudo apt update`
  * `sudo apt install paper-icon-theme`
  * `sudo apt install gnome-tweak-tool`
  * *Tweaks > Appearance > Applications > Adwaita-dark*
  * *Tweaks > Appearance > Icons > Paper*
  * *Tweaks > Fonts > [your_favourite_font]*

#### Desktop Slideshow
> *Shotwell Photo Manager > Select Pictures > File > Set as Desktop Slideshow*
<br>

### Neovim
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
<br>

### Node.js
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

#### Configure Defaults
 ```sh
 npm config set init.author.name <name>
 npm config set init.author.email <email>
 ```
See [additional tips](./nodejs.md) for more info.
<br>
<br>

### Terminal & Shell
#### [Tilix](https://github.com/gnunn1/tilix)
 1. Install Tilix
    > `sudo apt install tilix`
 2. Customize Tilix Appearance
    * *Preferences > Appearance > Window Style > Disable CSD && hide toolbar*
    * *Preferences > Appearance > Terminal Title Style > None*
    * *Preferences > Profile > Color > Color scheme > Monokai Dark*
 3. Configure Tilix Keyboard Shortcuts
    * *Preferences > Shortcuts > Replace **`Switch to next session`** shortcut with **`Ctrl+T`***
    * *Preferences > Shortcuts > Replace **`Resize the terminal down`** shortcut with **`Shift+Ctrl+Down`***
    * *Preferences > Shortcuts > Replace **`Resize the terminal up`** shortcut with **`Shift+Ctrl+Up`***
    * *Preferences > Shortcuts > Replace **`Resize the terminal right`** shortcut with **`Shift+Ctrl+Right`***
    * *Preferences > Shortcuts > Replace **`Resize the terminal left`** shortcut with **`Shift+Ctrl+Left`***
 4. Configure System Keyboard Shortcuts
    * *Keyboard Shortcuts > Remove Default Action for **`Ctrl+Alt+T`***
    * *Keyboard Shortcuts > Bind **`Ctrl+Alt+T`** to Custom Shortcut for Launching Tilix*
    * *Keyboard Shortcuts > Disable Shortcut for **`Hide all normal windows`***

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
<br>

### Visual Studio Code
 1. [Download the .deb package](https://code.visualstudio.com/docs/?dv=linux64_deb) 
 2. Download Extensions
    * Vim 
    * Python
    * ESLint
    * Prettier
    * Dracula *or* Winter Is Coming
    * Live Server
    * ES7 React/Redux/GraphQL/React-Native snippets
    * REST Client
    * GitLens
    * Material Icon Theme
    * Auto Rename Tag
 3. Copy the [settings file](vscode.settings.json) contents into `settings.json`
 4. `Ctrl+Shift+P > Python: Select Interpreter > Python 3.X`
 5. `npm install -g eslint`

#### Shortcuts
| Shortcut | Description |
| -------- | ----------- |
| `Ctrl+B` | Toggle sidebar |
| `Ctrl+,` | Open settings |
<br>

### Other Tools
 * [Peek](https://github.com/phw/peek)
    ```sh
    sudo add-apt-repository ppa:peek-developers/stable
    sudo apt update && sudo apt install peek
    ```
 * [ag](https://github.com/ggreer/the_silver_searcher) & [sack](https://github.com/sampson-chen/sack)
    ``` sh
    # 1. install ag
    sudo apt install silversearcher-ag
    
    # 2. install sack
    git clone https://github.com/sampson-chen/sack.git && \ 
    cd sack && \ 
    chmod +x install_sack.sh && \
    ./install_sack.sh && \
    cd .. && \
    rm -rf sack
   ```
<br>

### Docker
``` sh
# 1. remove any older versions
sudo apt purge docker lxc-docker docker-engine docker.io

# 2. install prerequisites
sudo apt install apt-transport-https ca-certificates software-properties-common

# 3. import official GPG key & verify signature
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add

# 4. add docker respository
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 5. install docker
sudo apt update && sudo apt install docker-ce

# 6. verify service status
sudo systemctl status docker

# 7. create docker group & add your user
sudo groupadd docker
sudo usermod -aG docker $USER
```

> Log out and login back.

``` sh
# 8. verify that you can run this command without 'sudo'
docker run hello-world

# 9. install docker-compose 1.24.0 (better check newer versions)
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 10. apply executable permission
sudo chmod +x /usr/local/bin/docker-compose
```

See [cheatsheet](./docker.md) for more info.

<br>

### MySQL
#### Download MySQL Docker Image
```sh
docker pull mysql/mysql-server:<tag>
```

#### Start MySQL Container
``` sh
# start server
docker run --name=<container_name> -d mysql/mysql-server:<tag>
```

#### Connect to MySQL Server from within the Container
 1. **Run the MySQL Client**
    ``` sh
    # check randomly generated password
    docker logs <container_name> 2>&1 | grep GENERATED

    # run the MySQL client within the MySQL Server container
    docker exec -it <container_name> mysql -uroot -p
    ```
    When prompted, paste the generated password obtained from the previous step.

 2. **Reset Root Password**
    ``` sh
    ALTER USER 'root'@'localhost' IDENTIFIED BY '<new_password>';
    ```

#### Backup & Restore
Backup & restore a particular database while MySQL container is running:
``` sh
# backup
docker exec <mysql_container_name> mysqldump \
    -u <username> --password=<password> <database_name> > <backup_file>.sql

# restore
cat <backup_file>.sql | docker exec -i <mysql_container_name> mysql \
    -u <username> --password=<password> <database_name>

# backup & compress
docker exec <mysql_container_name> mysqldump \
    -u <username> --password=<password> <database_name> | gzip -c > <backup_file>.sql.gz 

# decompress & restore
gzip -d -c <backup_file>.sql.gz | docker exec -i <mysql_container_name> mysql \
    -u <username> --password=<password> <database_name>
```

See [cheatsheet](https://gist.github.com/bradtraversy/c831baaad44343cc945e76c2e30927b3) for more info.
<br>

### DigitalOcean
 1. Follow the [Initial Server Setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04) guide.
 2. Append public SSH keys of each client machine into the `~/.ssh/authorized_keys` file in droplet.

### Useful Commands
``` sh
# list which processes listen on which TCP ports
netstat -tlnp
```
