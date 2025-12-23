
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuki.matsukura/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/yuki.matsukura/Downloads/google-cloud-sdk/path.fish.inc'; end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by Antigravity
fish_add_path /Users/yuki.matsukura/.antigravity/antigravity/bin
export PATH="$HOME/.local/bin:$PATH"

if status is-interactive
    # 起動時の挨拶
    fastfetch
end
