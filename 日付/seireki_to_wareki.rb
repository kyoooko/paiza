# # ＜令和1年5月1日などと表示する（不正解)＞
# input_line = gets
# array = input_line.split(' ')
# # 文字列/6月→6
# y = array[0]
# m = array[1]
# d = array[2]

# # 数字一桁を表現したいが下記の方法ではできず
# # puts 'No' if m =~ /(\d)/
# # puts 'No' if m =~ /[0-9]/
# # puts 'No' if m =~ /\d/
# # puts 'No' if m =~ /\d{1,1}/

# # 文字列/6月→06
# m.length == 1 ? m_2digits = "0#{m}" : m_2digits = "0#{m}"
# d.length == 1 ? d_2digits = "0#{d}" : d_2digits = "0#{d}"

# # 演算子使うために整数/6月→06(19930618のようなinteger)
# # line = input_line.split(' ').join('').to_i
# line = (y + m_2digits + d_2digits).to_i

# if line >= 18680125 && line <= 19120729
#   puts "明治#{y.to_i - 1867}年#{m}月#{d}日"
# elsif line >= 19120730 && line <= 19261224
#   puts "大正#{y.to_i - 1911}年#{m}月#{d}日"
# elsif line >= 19261225 && line <= 19890107
#   puts "昭和#{y.to_i - 1925}年#{m}月#{d}日"
# elsif line >= 19890108 && line <= 20190430
#   puts "平成#{y.to_i - 1988}年#{m}月#{d}日"
# elsif line >= 20190501
#   puts "令和#{y.to_i - 2018}年#{m}月#{d}日"
# end

# ====================================================================-

# <問題通り令和年5月1日と表示する＞
# input_line = gets
# array = input_line.split(' ')
# # 文字列/6月→6
# y = array[0]
# m = array[1]
# d = array[2]

# # 文字列/6月→06
# m.length == 1 ? m_2digits = "0#{m}" : m_2digits = m
# d.length == 1 ? d_2digits = "0#{d}" : d_2digits = d

# # 演算子使うために整数/6月→06(19930618のようなinteger)
# # line = input_line.split(' ').join('').to_i
# line = (y + m_2digits + d_2digits).to_i

# if line >= 18680125 && line <= 19120729
#   puts "明治年#{m}月#{d}日"
# elsif line >= 19120730 && line <= 19261224
#   puts "大正年#{m}月#{d}日"
# elsif line >= 19261225 && line <= 19890107
#   puts "昭和年#{m}月#{d}日"
# elsif line >= 19890108 && line <= 20190430
#   puts "平成年#{m}月#{d}日"
# elsif line >= 20190501
#   puts "令和年#{m}月#{d}日"
# end

# ====================================================================-

# <解答＞
y, m, d = gets.split.map(&:to_i)

date_number = y * 10_000 + m * 100 + d

era =
  case date_number
  when 1873_01_01..1912_07_29
    '明治'
  when 1912_07_30..1926_12_24
    '大正'
  when 1926_12_25..1989_01_07
    '昭和'
  when 1989_01_08..2019_04_30
    '平成'
  when 2019_05_01..3000_12_31
    '令和'
  end

puts "#{era}年#{m}月#{d}日"

# ================================-
# ◆文字列の連結 P24
# 1.+
# ```
# moji = ’文字’  
# puts ’これは’ + moji
# ```

# 2.#{}
# ```
# moji = ’文字’  
# puts ’これは#{moji}’
# ```

# * 数値と文字列は+で繋げないので#{}使う

# # ◆配列の要素を変数に代入
# ```
# y = array[0]
# ```

# # ◆三項演算子
# ```
# m.length == 1 ? m_2digits = " 0#{m} " : m_2digits = m
# ```

# 下記と同じ
# ```
# if m.length == 1
#  m_2digits = " 0#{m} "
# else
#  m_2digits = m
# end
# ```

# # ◆ブロックの省略形(&:to_i)
# ```
# y, m, d = gets.split.map(&:to_i)

# 下記と同じ
# gets.split.map do |a| a.to_i end

# ```

# # ◆splitはどうやら引数なしだとsplit(‘ ‘)と同じになるっぽい
# ```
# fuga = gets.split
# p fuga

# 実行
# aa bb cc
# ["aa", "bb", "cc"]
# ```

# # ◆つまりgets.split.map(&:to_i)は
# [paizaの問題を解くときに使えるテクニック1(Ruby編) - Qiita](https://qiita.com/ryuchan00/items/9da4f8b62d6af3f29b4a)
# ```
# hoge = gets.split(' ').map do |a| a.to_i end
# p hoge

# 実行
# 1 2 3
# [1, 2, 3]
# ```

# # ◆そしてmapを複数の変数に代入することもできる
# ```
# y, m, d = gets.split.map(&:to_i)
# p y
# p m
# p d

# 実行
# 1 2 3

# 1
# 2
# 3
# ```

# # ◆桁数多い時は_
# [桁の多い数値を扱う時はアンダーバーで区切る - Bye Bye Moore](https://shuzo-kino.hateblo.jp/entry/2014/02/09/225652)
# ```
# 10000 #=> 10000

# 10_000 #=> 10000

# 100_00 #=> 10000

# 1_0000 #=> 10000
# ```

# # ◆6月は06に変換しなければいけない問題
# 計算(date_number = y * 10_000 + m * 100 + d)にて解消する方法がある
# 私はif文で1桁なら0つけると言う方法でやった
# （正規表現でやりたかったがうまく使えず）

# # ◆..
# =数値A〜数値B(AもBも含む）
# * case when使える


# # ◆p, puts ,print
# [【Ruby】p, puts, printメソッドの違い - Qiita](https://qiita.com/ryo0916/items/daf75aca9675f5a01d17)
# Printは改行なし
# Putsはmapでも1 2 3と表示されるがpなら[1,2,3]と出てくる
# Pは開発者向け、そのまま « や[]表示
