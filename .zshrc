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
setopt always_last_prompt
setopt cdable_vars
setopt sh_word_split
setopt auto_param_keys
setopt auto_pushd
setopt list_packed
setopt list_types
setopt no_case_glob
setopt complete_in_word
setopt magic_equal_subst
setopt auto_param_slash
setopt print_eight_bit
setopt brace_ccl

# C-s, C-qを無効にする。
setopt no_flow_control

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space

# hide rprompt after execute the command.
setopt transient_rprompt


# ディレクトリ名だけで移動できる。
setopt auto_cd
#cdpath=(.. ~ ~/src)
# }}}
# {{{ OS setting
umask 0002
ulimit -n 1024
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
# {{{ VCS setting
# http://d.hatena.ne.jp/mollifier/20090814/p1
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<10->)* ]]; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    RPROMPT="%1(v|%F{green}%1v%f|)"
fi
# }}}
# {{{ git increasing response speed setting
# http://u7fa9.org/memo/HEAD/archives/2011-02/2011-02-01.rst
__git_files() { _files }
# }}}
# {{{ login check
watch=(notme)
LOGCHECK=10
WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"
# }}}
# {{{ prompt (PS1)
setopt prompt_subst
local DARKC=$'%{\e[38;5;47m%}'
local LIGHTC=$'%{\e[38;5;46m%}'
local DEFAULTC=$'%{\e[m%}'
PROMPT=$DARKC"[%U$USER@%m "$LIGHTC"%~%u"$DARKC"]%# "$DEFAULTC
# }}}
# {{{ history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000
function history-all { history -E 1 }
# }}}
# {{{ prints all color setting
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done

    echo
    echo 

    echo "tmux color code"
    for i in $(seq 0 4 255); do
        for j in $(seq $i $(expr $i + 3)); do
            for k in $(seq 1 $(expr 3 - ${#j})); do
                printf " "
            done
            printf "\x1b[38;5;${j}mcolour${j}"
            [[ $(expr $j % 4) != 3 ]] && printf "    "
        done
        printf "\n"
    done

    echo "zsh"
    for COLOR in $(seq 0 255)
    do
        for STYLE in "38;5"
        do
            TAG="\033[${STYLE};${COLOR}m"
            STR="${STYLE};${COLOR}"
            echo -ne "${TAG}${STR}${NONE}  "
        done
        echo
    done


    printf "\n"
}
# }}}
# {{{ override function
# Execute when pwd is changed
function chpwd() { ll }

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache yes
# }}}
# {{{ keychain
export HOSTNAME=`hostname`
if [ -f ~/.keychain/$HOSTNAME-sh ]; then
    keychain --timeout 10080 ~/.ssh/id_rsa
    . ~/.keychain/$HOSTNAME-sh
fi
# }}}
# {{{ rails setting
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
# }}}
# {{{ grep setting
## GNU grepがあったら優先して使う。
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
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
### 可能なら色を付ける。
#if grep --help | grep -q -- --color; then
#	GREP_OPTIONS="--color=always $GREP_OPTIONS"
#fi
# }}}
# {{{ z
. ~/.setting/lib/z/z.sh
# }}}
# {{{ git flow
source ~/.setting/lib/git-flow-completion/git-flow-completion.zsh
# }}}
# {{{ zsh-syntax-highlighting
source ~/.setting/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
# {{{ local setting. 
if [[ -f ~/.zshrc_local ]] ; then;
    source ~/.zshrc_local
fi
# }}}
# {{{ tmux setting
# showing branch infor on left side.
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
# }}}
# {{{ rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#source /Users/matsu/.rvm/scripts/rvm
# }}}
# {{{ perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]
then
    source ~/perl5/perlbrew/etc/bashrc
fi
# }}}
# {{{ history back
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# }}}
# {{{ Auto completion
fpath=(~/.setting/lib/zsh-completions.git/src $fpath)
# }}}
# {{{ calculation function
calc(){ awk "BEGIN{ print $* }" ;}
# }}}
# {{{ startup command
if [ -x "`which tmux`" ]; then
  tmux attach -d
fi
# }}}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
