##
# ~/.zshenv
##
# {{{ alias
alias ls='ls --color=auto --time-style=+"%Y/%m/%d %H:%M:%S" -p'
alias sl='ls'

alias la='ls -a' ll='ls -l' le='less -e'
alias j=jobs    sw='%-'   z=suspend

alias up='svn up'

alias vi='vim'
alias v='vi'

alias debian_upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

alias r='rails'
alias zshrc="vi ~/.zshrc"

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'


# super shortcut
# ex: findg TestAction
alias findg='find . | grep '

alias ...='cd ../..'
alias ....='cd ../../..'


alias historytime="history -nir 0 | less"

# execute row priority
alias allnice="ionice -c2 -n7 nice -n19"
# execute command with low priority
alias lowpriority="ionice -c3 nice -n19"

alias g="git"
alias gi="git"

if type hub > /dev/null 2>&1; then
  alias g="hub"
fi

alias simple_http_server="python -m SimpleHTTPServer"
# }}}
# {{{ History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000
# }}}
# {{{ encoding
#export LANG=ja_JP.utf8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8
# }}}
# {{{ FSF color management
export LS_COLORS="no=00:fi=00:di=04;35:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# BSD color management
export LSCOLORS=cxfxcxdxbxegedabagacad
# }}}
# {{{ Environment variable
export VISUAL=vim
export EDITOR=vim
export SVN_EDITOR=vim

# ignore ssl certificate when using git
export GIT_SSL_NO_VERIFY=true

export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

export GOPATH=$HOME
# }}}
# {{{ lv setting
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
    export LV="-c -l -Ia -Oa"
    alias less="lv"
else
    export PAGER="less"
fi
# }}}
# {{{ grep setting
## デフォルトオプションの設定
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
#GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する。
GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
export GREP_OPTIONS
### 可能なら色を付ける。
#if grep --help | grep -q -- --color; then
#	GREP_OPTIONS="--color=always $GREP_OPTIONS"
#fi
# }}}
# {{{ OS specific setting
case ${OSTYPE} in
  darwin*)
    alias updatedb=/usr/libexec/locate.updatedb
    alias ls='ls -G -p'

    alias notify="terminal-notifier -message"

    ;;
  linux*)
    #ここにLinux向けの設定
    ;;
esac

# }}}
# {{{ oh-my-zsh tmux plugin setting
if [ -x "`which tmux`" ]; then
  if [ -n "$SSH_TTY" ]; then
    export ZSH_TMUX_AUTOSTART=true
  fi
fi
# }}}
# {{{ nodebrew settings
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
# }}}
# {{{ PATH
export PATH=~/bin:bin/:~/.settings/bin:~/.setting/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin
path=(
  $path
  ~/.nodebrew/current/bin(N-/)
  ~/bin(N-/)
  /usr/local/share/npm/lib/node_modules/grunt-cli/bin(N-/)
  ~/Documents/adt/sdk/platform-tools/(N-/)
  /usr/local/share/npm/bin/
)
# }}}

