# [Will](https://nerdzzh.me/)'s dotfiles

Currently I am on a Ubuntu 20.04 PC.

## credits

[https://github.com/ctaylo21/jarvis](https://github.com/ctaylo21/jarvis)

## nerd fonts

- [Hack](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip)
- [FiraCode](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip)
- [SourceCodePro](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip)

## homebrew

- bat
- curl
- exa
- fd
- fish
- fzf (`/home/linuxbrew/.linuxbrew/opt/fzf/install`)
- gcc
- ghq
- git
- htop
- neovim
- net-tools
- node
- peco
- ranger
- tig
- tmux
- xsel

## npm

- commitizen
- cz-conventional-changelog (`echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc`)

## python

[https://www.anaconda.com/products/individual#linux](https://www.anaconda.com/products/individual#linux)

## tmux

[how to build tmux from source](https://nerdzzh.me/2021/10/23/build-tmux-from-source-and-use-tpm-tmux-plugin-manager/#build-tmux-from-source)

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

# ack.vim
brew install ack the_silver_searcher

# coc.nvim
brew install llvm

# tagbar
brew install universal-ctags
npm install -g jsctags

# vim-autoformat
brew install tidy-html5 shfmt
npm install -g clang-format prettier lua-fmt
pip install --upgrade autopep8 pycodestyle

# fzf
brew install bat fd
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
