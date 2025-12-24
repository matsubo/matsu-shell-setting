abbr -a -- dc "docker compose"
abbr -a -- g git
abbr -a -- l less
abbr -a -- j jobs
abbr -a -- c cat
abbr -a -- sl ls
abbr -a -- vi nvim
abbr -a -- v nvim
abbr -a -- vim nvim

### Disk Usage (df/du の置き換え)
if type -q duf
  abbr -a df 'duf'
end

if type -q dust
  abbr -a du 'dust'
end

### おまけ：さらにモダンな代替ツール
# 1. gping: グラフで表示される ping
#if type -q gping
#  abbr -a ping 'gping'
#end

# 2. procs: ps コマンドのモダン版 (ezaと同じような色使い)
#if type -q procs
#  abbr -a ps 'procs'
#end

# 3. bottom (btm): top/htm の進化版。非常に高機能。
if type -q btop
  # abbr -a top 'btm'
  abbr -a top 'btop'
end

if type -q fastfetch
  abbr -a fetch 'fastfetch'
end

if type -q bat
  abbr -a cat 'bat'
end

