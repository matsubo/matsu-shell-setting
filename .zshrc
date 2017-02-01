##
# ~/.zshrc
##
# {{{ setopt
setopt auto_menu
setopt correct
setopt auto_name_dirs
setopt auto_remove_slash
setopt extended_history
setopt hist_ignore_dups
setopt pushd_ignore_dups
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob
setopt hist_ignore_all_dups
setopt no_beep
setopt sh_word_split
setopt auto_param_keys
setopt auto_pushd
setopt list_packed
setopt list_types
setopt no_case_glob
setopt complete_in_word

setopt prompt_subst

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
setopt auto_param_slash

# show japanese character
setopt print_eight_bit

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# C-s, C-qを無効にする。
setopt no_flow_control

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space

# hide rprompt after execute the command.
setopt transient_rprompt

# treat comment after sharp.
setopt interactive_comments

# do not share history within shells
unsetopt share_history

# ディレクトリ名だけで移動できる。
setopt auto_cd
#cdpath=(.. ~ ~/src)
# }}}
# {{{ basic zsh behavior
autoload -U compinit
compinit -u
bindkey -e

bindkey \^U backward-kill-line

# Show the execution consumed resource
# If the command takes over following sec.
REPORTTIME=2

NAME='Yuki Matsukura'
# }}}
# {{{ zplug setting
if [[ -f $HOME/.setting/lib/zplug/init.zsh ]]; then

  source ~/.setting/lib/zplug/init.zsh

  zplug "chrissicool/zsh-256color", use:"zsh-256color.plugin.zsh"

  zplug "zsh-users/zsh-completions"

  # Make sure you use double quotes
  zplug "zsh-users/zsh-history-substring-search"

  # Can manage a plugin as a command
  # And accept glob patterns (e.g., brace, wildcard, ...)
  zplug "Jxck/dotfiles", as:command, use:"bin/{ip}"

  # Grab binaries from GitHub Releases
  # and rename to use "file:" tag
  zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:fzf

  # Support oh-my-zsh plugins and the like
  #zplug "plugins/git",     from:oh-my-zsh, if:"which git"
  #zplug "plugins/rails",   from:oh-my-zsh, if:"which rails"
  zplug "plugins/brew",    from:oh-my-zsh, if:"which brew"
  zplug "plugins/tmux",    from:oh-my-zsh, if:"which tmux"
  zplug "plugins/bundler", from:oh-my-zsh, if:"which bundler"
  zplug "plugins/ruby",    from:oh-my-zsh, if:"which ruby"
  #zplug "plugins/rbenv",   from:oh-my-zsh # does not work when if installed in $HOME/.rbenv

  zplug "themes/blinks", from:oh-my-zsh
  zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"


  # Set priority to load command like a nice command
  # e.g., zsh-syntax-highlighting must be loaded
  # after executing compinit command and sourcing other plugins
  zplug "zsh-users/zsh-syntax-highlighting", defer:3


  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load --verbose


fi
# }}}
# {{{ rbenv
if type rbenv > /dev/null 2>&1; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# }}}
# {{{ nodebrew settings
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
# }}}
# {{{ pyenv
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# }}}
# {{{ prints all color setting
function pcolor() {
  for c in {016..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($((c-16))%6)) -eq 5 ] && echo;done;echo
}
# }}}
# {{{ prints my global ip address
function myip() {
  curl kakunin.teraren.com
}
# }}}
# {{{ OS setting
umask 0002
ulimit -n 1024
# }}}
# {{{ override function
# Execute when pwd is changed
function chpwd() { ll }

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache yes
# }}}
# {{{ use-cache
# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' use-cache true
# }}}
# {{{ keychain
export HOSTNAME=`hostname`
if [ -f ~/.keychain/$HOSTNAME-sh ]; then
    keychain --timeout 10080 ~/.ssh/id_rsa
    . ~/.keychain/$HOSTNAME-sh
fi
# }}}
# {{{ startup command
source ~/.tmuxinator/tmuxinator.zsh
# }}}
# {{{ local setting. 
if [[ -f ~/.zshrc_local ]] ; then;
    source ~/.zshrc_local
fi
# }}}
