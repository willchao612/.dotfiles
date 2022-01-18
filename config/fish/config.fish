# Author: Will Chao <nerdzzh@gmail.com>
# Last Change: 12/28/2021 05:19:44 PM +0800

# Clear that annoying greeting message
set -U fish_greeting ''

if test -d $HOME/anaconda3 # Python
  set -x PATH $PATH $HOME/anaconda3/bin $HOME/.local/bin
end

if test -d /usr/local/cuda-11.1/bin # CUDA
  set -x PATH $PATH /usr/local/cuda-11.1/bin
  set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda-11.1/lib64
end

if type -q java # Java
  set -gx JAVA_HOME (readlink -f (which java) | sed "s:/jre/bin/java::")
end

if type -q gem # Gem
  set -gx GEM_HOME $HOME/gems
  set -x PATH $PATH $GEM_HOME/bin
end

if test -d /home/linuxbrew # Homebrew
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q fzf
  # Default
  set -U FZF_DEFAULT_OPTS '--layout=reverse --border --bind=ctrl-h:page-up,ctrl-l:page-down,ctrl-y:preview-up,ctrl-e:preview-down'

  # Preview
  set -U FZF_CTRL_T_OPTS '--preview "cat {}"'
  set -U FZF_ALT_C_OPTS '--preview "ll {}"'

  set -U FZF_TMUX 1
  set -U FZF_TMUX_HEIGHT '50%'

  # With ag
  if type -q ag
    set -U FZF_CTRL_T_COMMAND 'ag --hidden --ignore .git -g "" $dir 2> /dev/null'
  end

  # With bat
  if type -q bat
    set -U FZF_CTRL_T_OPTS '--preview "bat {}"'
  end

  # With fd
  if type -q fd
    set -U FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
  end
end

if test -e $HOME/.config/fish/config.fish
  alias so='source $HOME/.config/fish/config.fish'
end

if type -q git
  alias g='git'
end

if type -q nvim
  set -gx EDITOR nvim
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
end

if type -q htop
  alias h='htop'
end

if type -q ranger
  alias r='ranger'
end

if type -q exa
  alias ls='exa --icons'
  alias ll='exa --icons --long --group --links'
  alias la='exa --icons --long --group --links --all'
end

if type -q bat
  set -gx BAT_THEME 'gruvbox-dark'
  set -gx BAT_STYLE 'plain'
  alias bat='bat --color=always'
end

if type -q cmatrix
  alias c='cmatrix -bsM "JUST DO"'
end
