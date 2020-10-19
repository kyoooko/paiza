# <自分の解答＞
input_line = gets.chomp
y,m = input_line.split.map(&:to_i)

# 閏年か確かめるメソッド
def uruudoshi?(y)
  (y % 400).zero? || (y % 100).nonzero?  && (y % 4).zero?
end

#  case whenの時は 4 || 6 || 9 || 11ではなく4,6,9,11で「対象オブジェクトが4か6か9か11にあたる時（SQLで言うとIN(a,b, c) )」
case m
when 4,6,9,11
  puts "30"
when 2
  puts uruudoshi?(y) ? "29" : "28"
else
  puts "31"
end

# =====================================================================--
# <解答＞
# def is_leap?(y)
#   (y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?
# end

# y, m = gets.split.map(&:to_i)

# puts case m
#      when 2
#        is_leap?(y) ? 29 : 28
#      when 4, 6, 9, 11
#        30
#      else
#        31
#      end

# =====================================================================--
# ◆ putsの位置
# * 例
# ```
# puts case m
#      when 2
#        is_leap?(y) ? 29 : 28
#      when 4, 6, 9, 11
#        30
#      else
#        31
#      end

# 下記よりスマート
# case m
# when 4,6,9,11
#   puts "30"
# when 2
#   puts uruudoshi?(y) ? "29" : "28"
# else
#   puts "31"
# end
# ```

# * 例
# ```
# puts uruudoshi?(y) ? "29" : "28"

# 下記ではない　
# uruudoshi?(y) ? puts "29" : puts "28"
# ```

# # ◆三項演算子
# * ⭐️putsの際,puts先

# ```
#  puts is_leap?(y) ? 'Yes' : 'No'

# 下記ではない　
# uruudoshi?(y) ? puts "29" : puts "28"
# ```


# # ◆case whenで複数の値を指定する(SQLで言うとIN(a,b, c) )
# [case文 - 条件分岐 - Ruby入門](https://www.javadrive.jp/ruby/if/index9.html)

# * ⭐️ case whenの時は 4 || 6 || 9 || 11ではなく4,6,9,11で「対象オブジェクトが4か6か9か11にあたる時（SQLで言うとy IN(a,b, c )/y =a OR  y=b OR y=c/=any(a,b, c)」
# ```
# case 対象オブジェクト
# when 値1,値2 then
#   ...
# when 値3,値4,値5 then
#   ...
# end
# ```



