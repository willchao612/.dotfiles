# [Will](https://nerdzzh.xyz/)'s dotfiles

Currently I am on a Ubuntu 22.04 PC.

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
- python3
- ranger
- ripgrep
- starship
- tig
- tldr
- tmux
- tmuxinator
- xsel
- zsh

## npm

- commitizen
- cz-conventional-changelog
  (`echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc`)

## nvim

```bash
# spell file for dict completion
sudo apt install wamerican

# binaries used by neoformat
brew install stylua shfmt
npm install -g clang-format prettier
pip3 install --upgrade yapf
rustup component add rustfmt
```
