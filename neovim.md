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

