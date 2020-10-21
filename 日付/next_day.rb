# <自分の解答＞
input_line = gets.chomp
y,m,d = input_line.split.map(&:to_i)

# 閏年か確かめるメソッド
def uruudoshi?(y)
  (y % 400).zero? || (y % 100).nonzero?  && (y % 4).zero?
end

# 年
y = y +1 if m == 12 && d == 31

# 月
month_31th = [1,3,5,7,8,10]
month_30th = [4,6,9,11]
# if  (m == 1 || 3 || 5 || 7 || 8 || 10) && (d == 31)はうまくできない
if  month_31th.include?(m) && (d == 31)
  m = m + 1
  d = 1
  # puts "a"
elsif month_30th.include?(m) && (d == 30)
  m = m + 1
  d = 1
  # puts "b"
elsif m == 2
  m = m + 1 if (uruudoshi?(y) == true && d == 29) || (uruudoshi?(y) == false && d == 28)
  d = 1
  # puts "c"
elsif m == 12 && d == 31
  m = 1
  d = 1
  # puts "d"
else
  d = d + 1
  # puts "e"
end

puts "#{y} #{m} #{d}"

# =====================================================================--
# <解答＞
# END_OF_MONTH = [
#   [1, 31],
#   [2, 29],
#   [3, 31],
#   [4, 30],
#   [5, 31],
#   [6, 30],
#   [7, 31],
#   [8, 31],
#   [9, 30],
#   [10, 31],
#   [11, 30]
# ]

# def is_leap?(y)
#   (y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?
# end

# def next_day(y, m, d)
#   case [m, d]
#   when [12, 31]
#     [y + 1, 1, 1]
#   when [2, 28]
#     is_leap?(y) ? [y, 2, 29] : [y, 3, 1]
#   when *END_OF_MONTH
#     [y, m + 1, 1]
#   else
#     [y, m, d + 1]
#   end
# end

# y, m, d = gets.split.map(&:to_i)

# puts '%d %d %d' % next_day(y, m, d)

# =====================================================================--

# ◆✅%d  と format(= sprintf)メソッド
# [【format】引数でよく見かける’%010d’の実態を解明Ruby - Qiita](https://qiita.com/takuyanin/items/3b210f166f24c6d13e5a)

# *  sprintf = 桁数を揃えられる
# =formatメソッドと同じ

# *フォーマットに従って文字列を生成（整形）し、オブジェクトとして返します*。
# Formatメソッドを使えば、例えば数字を返す時に10進数だけでなく、8進数や16進数で表示させたり、小数点の場合、何桁まで表示させるか、といった指定を簡単に行うことができます。

# * %d
# 整数を10進数で表現できます。
# 最初の引数は文字列で、その中で%文字という形式でどのように整形するかを指定し、それ以降の引数でフォーマット中の%文字に対応する値を順番に指定します。また、文字列 % 配列の形式でも指定することができます。
# ```
# $ irb
# irb(main):001:0> format('第二引数は%dです', 7)
# => "第二引数は7です"
# irb(main):002:0> format('%d/%d/%d' % [2018, 12, 21])
# => "2018/12/21"
# ```

# * 【頻出】format(‘%010d’, 数値)とは
#  数値（n）をformatメソッドで桁数を10に揃えているということになります(10進数表現)。
# ```
# $ irb
# irb(main):001:0> n = 7
# => 7
# irb(main):002:0> format(‘%010d’, n)
# => « 0000000007 »
# ```



# # ◆【上記の参考】小数点桁数指定 sprintf/%.2f
# [Rubyで小数点桁数指定 - Qiita](https://qiita.com/seteen/items/c8ac3a6349cd53ef25b7)
# * round
# ```
# 1.2345.round    #=> 1
# 1.2345.round(2) #=> 1.23
# 1.2345.round(3) #=> 1.235 (四捨五入)
# ```
# * sprintf
# ```
# sprintf( "フォーマット", 戻したい値 )
# ```
# [Rubyでsprintfを使う方法を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/30839)

# # ◆配列の中に配列

# # ◆case~  when 配列とすることも可能
# * case~  when * 配列とすることも可能(次の日）
# =*配列に値が含まれているかチェック*

# [Ruby の case 文で，値が配列に含まれているかを調べる - Qiita](https://qiita.com/zonkyy/items/30ebeecd849ecb6483ef)
# ```
# case [m, d]
#   when [12, 31]
#     [y + 1, 1, 1]
#   when [2, 28]
#     is_leap?(y) ? [y, 2, 29] : [y, 3, 1]
#   when *END_OF_MONTH
#     [y, m + 1, 1]
#   else
#     [y, m, d + 1]
#   end
# ```
