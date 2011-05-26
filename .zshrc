##
# ~/.zshrc
##

#export LANG=ja_JP.eucJP
export LANG=en_US.utf8
export LC_ALL=en_US
export LESSCHARSET=utf-8


setopt auto_menu auto_cd correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys
setopt NO_flow_control
setopt autopushd pushd_ignore_dups list_packed list_types EXTENDED_HISTORY

unsetopt promptcr

umask 0002

autoload -U compinit
compinit -u

## doesn't work 20101014
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end






watch=(notme)


#########################################
# environment variablel
#########################################
LOGCHECK=10
WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"


PROMPT="[%U$USER@%m %~%u]%# "

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000


# FSF color management
export LS_COLORS="no=00:fi=00:di=04;35:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# BSD color management
export LSCOLORS=cxfxcxdxbxegedabagacad


export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
NAME='Yuki Matsukura'

#########################################
# alias
#########################################

alias ls='ls --color=auto --time-style=+"%Y/%m/%d %H:%M:%S" -p'

alias la='ls -a' ll='ls -l' le='less -e'
alias j=jobs    sw='%-'   z=suspend

alias sc='svn commit -m "" --password=hogehoge --username=matsu'
alias up='svn up'

alias vi='vim'
alias v='vi'

alias ap='sudo /usr/local/apache2/bin/apachectl'
alias my='sudo /etc/init.d/mysql'

alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'



export EDITOR=vi
export PAGER=less

export MYSQL=/usr/local/mysql
export SAMBA=/usr/local/samba

export SVN_EDITOR=vi

export JAVA_HOME=/usr/local/java
export PATH=$MYSQL/bin/:$SAMBA/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:$JAVA_HOME/bin:/opt/local/bin
export PATH=~/archive/screen-4.0.3:$PATH


# Hit ^ = cd ..
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup




#########################################
# OS specific setting
#########################################
if [ -d /Users/ ]; then
  # mac
  alias updatedb=/usr/libexec/locate.updatedb
  alias ls='ls -G -p'
fi

if [ -f /usr/bin/ccache ];then
	export CC='ccache gcc'
	export CXX='ccache g++'
fi

#########################################
# override function
#########################################
function chpwd() { ll }

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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
# local setting. 
#########################################
LOCAL_SETTING="~/.zshrc_local"
if [ -f $LOCAL_SETTING ]; then
  source $LOCAL_SETTING
fi




#########################################
# startup command
#########################################

screen -r 


