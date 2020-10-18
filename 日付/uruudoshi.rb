# 閏年の判定（解答コード付き)
# ========================================================================================================================
# 問題
# 西暦yが与えられるので、閏年ならYesを、平年ならばNoを出力してください。

# 閏年か平年かは次のような条件によって判定することができます。
# ・西暦が4で割り切れる年は閏年
# ・ただし、100で割り切れる年は平年
# ・ただし、400で割り切れる年は閏年
# ・西暦が4で割り切れない年は平年

# ========================================================================================================================
# 自分の答え
y = gets.to_i
return unless y >= 1  && y <=10000
if  y % 400 == 0 
    puts 'Yes'
elsif y % 100 == 0 
	puts 'No'
elsif y % 4 == 0 
	puts 'Yes'
else
	puts 'No'
end

# ========================================================================================================================
# 回答例

# def is_leap?(y)
#   (y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?
# end

# y = gets.to_i

# puts is_leap?(y) ? 'Yes' : 'No'

# ========================================================================================================================
# ◆.zero?メソッド、.nonzero? メソッド
# * nonzero? -> self | nil
# 自身がゼロの時 nil を返し、非ゼロの時 self を返します。
# ```
# p 10.nonzero?              #=> 10
# p 0.nonzero?               #=> nil
# p 0.0.nonzero?             #=> nil
# p Rational(0, 2).nonzero?  #=> nil
# ```
# [Numeric#nonzero? (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Numeric/i/nonzero=3f.html)

# * zero? -> bool
# [ [permalink](https://docs.ruby-lang.org/ja/latest/method/Numeric/i/zero=3f.html) ][ [rdoc](https://docs.ruby-lang.org/en/2.7.0/Numeric.html#method-i-zero-3F) ][ [edit](https://github.com/rurema/doctree/edit/master/refm/api/src/_builtin/Numeric#L787) ]
# 自身がゼロの時、trueを返します。そうでない場合は false を返します。
# ```
# p 10.zero?              #=> false
# p 0.zero?               #=> true
# p 0.0.zero?             #=> true
# ```

# [Numeric#zero? (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Numeric/i/zero=3f.html)

# ⭐️⭐️なぜ(y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?なのか、trueとnilとかselfとか混在してないのか
# → (y % 100).nonzero? が300とかだったらnilを返し8とかだったら8を返す。8の場合は 8&&(y % 4).zero?で8 && trueになる。y==8ならtrue && trueでわかるけど、selfのままでいいのか？→self (8など)の部分はなんかそのままtrueになるっぽい


# # ◆||と&&の優先度
#  (y % 400).zero? ||  ((y % 100).nonzero? && (y % 4).zero?)

# P50
# ```
# 高い
# !
# &&
# ||
# Not
# And or
# 低い
# ```

# * &&と||が同時にあったら&&が優先される

# # ◆putsの後メソッドや三項演算子あるんだ…
# # ◆メソッド作るんだ…
