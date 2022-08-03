#!/usr/bin/env bash
echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=$PWD

source install/backup.sh
source install/link.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/home/linuxbrew/.linuxbrew/bin/brew"
if [ -f "$brew" ]; then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)JARVIS: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)JARVIS: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "bat"
  "curl"
  "exa"
  "fd"
  "fzf"
  "gcc"
  "git"
  "htop"
  "neovim"
  "net-tools"
  "node"
  "python3"
  "ranger"
  "ripgrep"
  "tig"
  "tldr"
  "tmux"
  "xsel"
  "zsh"
)

for i in "${packages[@]}"; do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install --upgrade neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)JARVIS: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing zsh plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

zsh_plugins=("zsh-autosuggestions" "zsh-syntax-highlighting")

for i in "${zsh_plugins[@]}"; do
  if [ ! -d "$HOME/.zsh/$(basename $i)" ]; then
    git clone "https://github.com/zsh-users/$i" ~/.zsh/$(basename $i)
    echo "---------------------------------------------------------"
  fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing ranger plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

ranger_plugins=(
  "alexanderjeurissen/ranger_devicons"
  "maximtrp/ranger-archives"
)

for i in "${ranger_plugins[@]}"; do
  if [ ! -d "$HOME/.config/ranger/plugins/$(basename $i)" ]; then
    git clone "https://github.com/$i" ~/.config/ranger/plugins/$(basename $i)
    echo "---------------------------------------------------------"
  fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
