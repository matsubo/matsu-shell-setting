alias g git
alias sl ls
alias j jobs
alias vi vim
alias v vi
alias r rails
alias vifish "vi ~/.config/fish/config.fish"
alias reload ". ~/.config/fish/config.fish"

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

set -U fish_user_paths $HOME/bin $HOME/Library/Android/sdk/platform-tools

set diff /usr/local/share/git-core/contrib/diff-highlight
if [ -f  $diff ] ; set -U fish_user_paths $fish_user_paths $diff ;  end

function cd
  builtin cd $argv
  ls -la
end


# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"


# attach tmux if remote server
if [ $SSH_TTY ]; then ; tmux a; end

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

