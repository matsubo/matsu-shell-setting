alias g git
alias sl ls
alias j jobs
alias vi vim
alias v vi
alias r rails
alias vifish "vi ~/.config/fish/config.fish"
alias reload "source ~/.config/fish/config.fish"

set VISUAL vim
set EDITOR vim
set SVN_EDITOR vim

set GIT_SSL_NO_VERIFY true

set NAME 'Yuki Matsukura'

if which keychain > /dev/null ^&1 
  eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
end

if [ ! -f ~/.config/fish/functions/fisher.fish ]
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  fisher eval(cat ~/.config/fish/fishfile)
end

set -U fish_user_paths $HOME/bin

set diff /usr/local/share/git-core/contrib/diff-highlight
if [ -f  $diff ] ; set -U fish_user_paths $fish_user_paths $diff ;  end

function cd
  builtin cd $argv
  ls -la
end
