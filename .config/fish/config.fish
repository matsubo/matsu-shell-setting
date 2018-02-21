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

#set -gx HOSTNAME (hostname)
#if status --is-interactive;
# keychain --nogui --clear ~/.ssh/id_rsa
# [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
#end

if which keychain > /dev/null ^&1 
  eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)
end

set -U fish_user_paths $HOME/bin
[ -f /usr/local/share/git-core/contrib/diff-highlight ] ; set -U fish_user_paths $fish_user_paths /usr/local/share/git-core/contrib/diff-highlight

function cd
  builtin cd $argv
  ls -la
end
