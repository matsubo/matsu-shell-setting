# alias

# modern command replacement
if type -q eza
  alias ls eza
end
if type -q bat
  alias cat bat
end

alias vifish "vi ~/.config/fish/config.fish"
alias reload "source ~/.config/fish/config.fish"


# abbr
abbr -a g git
abbr -a sl ls
abbr -a j jobs
abbr -a vi vim
abbr -a v vim
abbr -a l less
abbr -a c cat
abbr -a dc docker compose

# environment variables
set VISUAL vim
set EDITOR vim
set SVN_EDITOR vim

set GIT_SSL_NO_VERIFY true

set NAME 'Yuki Matsukura'

if which keychain > /dev/null
  eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
end

if [ ! -f ~/.config/fish/functions/fisher.fish ]
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  fisher eval(cat ~/.config/fish/fishfile)
end

set diff /usr/local/share/git-core/contrib/diff-highlight
if [ -f  $diff ] ; set -U fish_user_paths $fish_user_paths $diff ;  end


function cd
  builtin cd $argv
  ls -la
end

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# python
set -x PATH $HOME/.local/bin $PATH

# attach tmux if remote server
#if test -n "$SSH_TTY"
#  tmux a
#end

