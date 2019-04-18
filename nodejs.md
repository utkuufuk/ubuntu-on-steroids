# Node.js Cheatsheet
## Installation
### Install Node.js
 ```sh
 curl -sL https://deb.nodesource.com/setup_<version>.x | sudo -E bash -
 sudo apt install -y nodejs
 ```

### Change the Location of Global Packages
 1. `cd ~ && mkdir .node_modules_global`
 2. `npm config set prefix=$HOME/.node_modules_global`
 3. `npm install npm@latest -g`
 4. `.zshrc > export PATH="$HOME/.node_modules_global/bin:$PATH"`
 5. `source ~/.zshrc`

### Update Npm
 ```sh
 npm install npm@latest -g 
 npm rebuild
 ```

### Configure Defaults
 ```sh
 npm config set init.author.name <name>
 npm config set init.author.email <email>
 ```

## Useful Commands
For applicable commands below, add `-g` for *global* packages.

| Command               | Description                           |
|:----------------------|:--------------------------------------|
| `npm ls --depth=0`    | List installed packages               |
| `npm outdated`        | List outdated packages                |
| `npm dedupe`          | Reduce duplication in package tree    |
| `npm prune`           | Remove extraneous packages            |
