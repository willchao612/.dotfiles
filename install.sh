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
if [ -f "$brew" ]
then
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
  "fish"
  "fzf"
  "gcc"
  "ghq"
  "git"
  "htop"
  "neovim"
  "net-tools"
  "node"
  "peco"
  "ranger"
  "tig"
  "tldr"
  "tmux"
  "xsel"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing Python NeoVim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip install --upgrade neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

npm install -g neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing fish plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && fisher update"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing ranger plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

ranger_plugins=(
  "alexanderjeurissen/ranger_devicons"
  "maximtrp/ranger-archives"
)

for i in "${ranger_plugins[@]}"
do
  if [ ! -d "$HOME/.config/ranger/plugins/$(basename $i)" ]; then
    git clone "https://github.com/$i" ~/.config/ranger/plugins/$(basename $i)
    echo "---------------------------------------------------------"
  fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Switching shell to fish. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which fish) >> /etc/shells"
chsh -s $(which fish)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
