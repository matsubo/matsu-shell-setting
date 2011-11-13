##
# ~/.zshrc
##

#export LANG=ja_JP.eucJP
#export LANG=en_US.utf8
export LANG=ja_JP.utf8
export LC_ALL=en_US
export LESSCHARSET=utf-8


setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys
setopt NO_flow_control
setopt auto_pushd pushd_ignore_dups list_packed list_types no_case_glob
setopt complete_in_word
setopt magic_equal_subst

unsetopt promptcr

umask 0002

autoload -U compinit
compinit -u

## doesn't work 20101014
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end



# git completion
#autoload bashcompinit
#bashcompinit
#source ~/.setting/.git-completion.bash

# http://u7fa9.org/memo/HEAD/archives/2011-02/2011-02-01.rst
__git_files() { _files }


watch=(notme)


#########################################
# environment variablel
#########################################
LOGCHECK=10
WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"


# prompt
setopt prompt_subst
local DARKC=$'%{\e[38;5;47m%}'
local LIGHTC=$'%{\e[38;5;46m%}'
local DEFAULTC=$'%{\e[m%}'
PROMPT=$DARKC"[%U$USER@%m "$LIGHTC"%~%u"$DARKC"]%# "$DEFAULTC

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000
function history-all { history -E 1 }

# prints all color setting
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done
    echo
}

# FSF color management
export LS_COLORS="no=00:fi=00:di=04;35:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# BSD color management
export LSCOLORS=cxfxcxdxbxegedabagacad


export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
NAME='Yuki Matsukura'

REPORTTIME=2


#########################################
# alias
#########################################

alias ls='ls --color=auto --time-style=+"%Y/%m/%d %H:%M:%S" -p'

alias la='ls -a' ll='ls -l' le='less -e'
alias j=jobs    sw='%-'   z=suspend

alias up='svn up'

alias vi='vim'
alias v='vi'

alias ap='sudo /usr/local/apache2/bin/apachectl'
alias my='sudo /etc/init.d/mysql'
alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

alias r='rails'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'

alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

#alias cd="pushd"
#alias bd="popd"

# super shortcut
# ex: g TestAction
alias g='find . | grep '


# for work
alias findgrep="find -type d -name '.svn' -prune -o -type f -print | xargs grep -n"



export EDITOR=vi
export MYSQL=/usr/local/mysql
export SAMBA=/usr/local/samba

export SVN_EDITOR=vi

export JAVA_HOME=/usr/local/java
export PATH=$MYSQL/bin/:$SAMBA/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:$JAVA_HOME/bin:/opt/local/bin
export PATH=~/archive/screen-4.0.3:$PATH
export PATH="/opt/local/bin":$PATH


# Hit ^ = cd ..
#function cdup() {
#  echo
#  cd ..
#  zle reset-prompt
#}
#zle -N cdup
#bindkey '\^' cdup


if type lv > /dev/null 2>&1; then
	export PAGER="lv"
	export LV="-c -l -Ou8"
	alias less="lv"
else
	export PAGER="less"
fi


#########################################
# OS specific setting
#########################################
if [ -d /Users/ ]; then
  # mac
  alias updatedb=/usr/libexec/locate.updatedb
  alias ls='ls -G -p'
	export PATH=$PATH:/usr/local/git/bin
fi

if [ -f /usr/bin/ccache ];then
	export CC='ccache gcc'
	export CXX='ccache g++'
fi

if [ -f /usr/bin/ccache ];then
	export CC='ccache gcc'
	export CXX='ccache g++'
fi

#########################################
# override function
#########################################
function chpwd() { ll }

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache yes



bindkey -e


#########################################
# keychain
#########################################
export HOSTNAME=`hostname`
if [ -f ~/.keychain/$HOSTNAME-sh ]; then
  keychain ~/.ssh/id_rsa
  . ~/.keychain/$HOSTNAME-sh
fi


#########################################
# dev setting. 
#########################################
export ETHNA_HOME="/usr/local/lib/php/Ethna"
export PATH=$PATH:$ETHNA_HOME/bin
alias ethna=ethna.sh
alias screen="screen -U"


#########################################
# rails setting
#########################################
_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd `cat .rake_tasks`
  fi
}

compdef _rake rake


#########################################
# grep setting
#########################################
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
	alias grep=ggrep
fi
## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
### 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する。
if grep --help | grep -q -- --exclude-dir; then
	GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
	GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
	GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
	GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi
### 可能なら色を付ける。
#if grep --help | grep -q -- --color; then
#	GREP_OPTIONS="--color=always $GREP_OPTIONS"
#fi


#########################################
# VCS setting
#########################################
# http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"


#########################################
# local setting. 
#########################################
LOCAL_SETTING="~/.zshrc_local"
if [ -f $LOCAL_SETTING ]; then
  source $LOCAL_SETTING
fi


#########################################
# Finder local setting
#########################################
#$ cd /System/Library/CoreServices/SystemFolderLocalizations/
#$ sudo mv Japanese.lproj Japanese.lproj.back 
#$ sudo cp -r en.lproj Japanese.lproj
#$ killall Finder
#########################################


#########################################
# startup command
#########################################

#screen -xrU
screen -r


