#!/usr/bin/env bash
echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=$PWD

source install/backup.sh
source install/link.sh

source install/brew
source install/nvim
source install/zsh
source install/tmux
source install/ranger
source install/yabai

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ $SHELL != $(which zsh) ]; then
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
