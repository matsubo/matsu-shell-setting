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

alias ap='sudo /usr/local/apache2/bin/apachectl'
alias my='sudo /etc/init.d/mysql'
alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

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


#alias cd="pushd"
#alias bd="popd"

# super shortcut
# ex: findg TestAction
alias findg='find . | grep '

alias ...='cd ../..'
alias ....='cd ../../..'


# {{{ dstat
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
alias dstat-top-cpu='dstat --top-cpu --top-cputime'
alias dstat-top-io='dstat --top-io --top-bio'

export DSTAT_MYSQL_USER=root
export DSTAT_MYSQL_PWD=
export DSTAT_MYSQL_HOST=127.0.0.1
alias dstat-mysql='dstat -T --mysql5-cmds --mysql5-conn --mysql5-io --mysql5-keys'
alias dstat-innodb='dstat -T --innodb-io --innodb-buffer --innodb-ops'
# }}}

alias historytime="history -nir 0 | less"

# execute row priority
alias allnice="ionice -c2 -n7 nice -n19"
# execute command with low priority
alias lowpriority="ionice -c3 nice -n19"

alias g="git"
alias gi="git"

alias simple_http_server="python -m SimpleHTTPServer"
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
export EDITOR=vi
export MYSQL=/usr/local/mysql

export SVN_EDITOR=vi

export JAVA_HOME=/usr/local/java
export MONGO_HOME=/usr/local/mongodb
export PATH=~/bin:~/.settings/bin:$MONGO_HOME/bin:$MYSQL/bin/:~/.setting/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:$JAVA_HOME/bin:/opt/local/bin:/usr/local/sbin:/usr/local/mysql/bin

# ignore ssl certificate when using git
export GIT_SSL_NO_VERIFY=true

export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

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
# {{{ OS specific setting
case ${OSTYPE} in
  darwin*)
    alias updatedb=/usr/libexec/locate.updatedb
    alias ls='ls -G -p'
    export GREP_OPTIONS


    if [ -f /usr/bin/ccache ];then
      export CC='ccache gcc'
      export CXX='ccache g++'
    fi

    ;;
  linux*)
    #ここにLinux向けの設定
    ;;
esac

# }}}
# {{{ PATH
path=(
  $path
  ~/.nodebrew/current/bin(N-/)
  ~/bin(N-/)
  /opt/local/bin(N-/)
  /usr/local/share/npm/lib/node_modules/grunt-cli/bin(N-/)
  ~/Documents/adt/sdk/platform-tools/(N-/)
  /usr/local/share/npm/bin/
)
# }}}
