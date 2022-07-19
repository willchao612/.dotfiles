# [Will](https://nerdzzh.me/)'s dotfiles

Currently I am on a Ubuntu 20.04 PC.

## credits

[https://github.com/ctaylo21/jarvis](https://github.com/ctaylo21/jarvis)

## homebrew

- bat
- curl
- exa
- fd
- fzf (`/home/linuxbrew/.linuxbrew/opt/fzf/install`)
- gcc
- git
- htop
- neovim
- net-tools
- node
- ranger
- ripgrep
- tig
- tldr
- tmux
- xsel
- zsh

## npm

- commitizen
- cz-conventional-changelog (`echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc`)

## python

[https://www.anaconda.com/products/individual#linux](https://www.anaconda.com/products/individual#linux)

## nvim

```sh
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# :checkhealth
npm install -g neovim
pip install --upgrade pynvim

# spell
sudo apt install wamerican

# coc.nvim
brew install llvm
rustup component add rls rust-analysis rust-src

# tagbar
brew install universal-ctags
npm install -g jsctags

# vim-autoformat
brew install tidy-html5 shfmt
npm install -g clang-format prettier lua-fmt
pip install --upgrade autopep8 pycodestyle
```

## others

```sh
# jekyll
sudo apt install ruby-full build-essential zlib1g-dev
gem install jekyll jekyll-paginate bundler

# mysql
sudo apt install mysql-server
sudo mysql_secure_installation
```
