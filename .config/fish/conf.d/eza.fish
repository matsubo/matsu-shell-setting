if type -q eza
  ### 1. eza の基本動作を関数で定義 (日付形式をグローバルに固定)
  # これにより、どのコマンド(ls, ll, eza)から呼ばれても yyyy/mm/dd になります
  function eza --description 'Alias for eza with custom date format'
    command eza --time-style="+%Y/%m/%d %H:%M" --group-directories-first $argv
  end

  ### 2. abbr (略語) の設定
  # ls と打てば eza に展開され、上記関数の日付設定が適用されます
  abbr -a ls  'eza'
  abbr -a ll  'eza -lhg --icons --header --octal-permissions'
  abbr -a la  'eza -alhg --icons --header --octal-permissions'
  abbr -a lt  'eza -T -L 2 --icons' # 木構造表示 (2階層)
  abbr -a lg  'eza -lhg --icons --git' # Gitステータス表示

  ### 3. カラーカスタマイズ (環境変数)
  # 日付をあえて薄いグレーにすることで、ファイル名を見やすくします
  set -gx EZA_COLORS "da=38;5;245:di=1;34:ex=33"
end
