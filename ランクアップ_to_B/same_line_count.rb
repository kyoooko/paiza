# <問題文>
# 1行目で文字列 s、2行目で文字列 t が入力されます。
# s が t の中で何回出現するかカウントして出力してください。
# ==============================================================================
# <自分の回答>
str = gets.chomp
input_line = gets.chomp
count = 0
#  =======================================
# if input_line.slice(str)
#   # puts "OK!"
#   count = count + 1
# else
#   # puts "No!"
# end

# puts count

#  =======================================
# abcdef
# ab,bc,cd,de,ef
# abc,bcd,cde

array = input_line.split('')
st_length = (str.length) - 1
puts line_length = (input_line.length) - 1
p array #["a", "b", "c", "d", "e", "f"]
# p array[0..(st_length)]  #["a", "b"]
# p array[(line_length - st_length)..(line_length)] #["e", "f"]

# →できず

# ==========================================
# <解答>
# pattern = gets.chomp
# string = gets.chomp

# result = 0
# (0..(string.size - pattern.size)).each do |i|
#   substring = string.slice(i, pattern.size)

#   if substring == pattern
#     result += 1
#   end
# end

# puts result

# →使ってるメソッドと考え方は割と近くて惜しい!!
# →⭐️ポイントは配列の要素（文字）を回すのでなくsliceの第一引数になる数（=●文字目）を回す

# =====================================================-

# p [10,20,30,40,50].slice(2)    #=> 30
# p ["a","b","c","d","e"].slice(2)    #=> "c"
# p ["a","b","c","d","e"].slice(0,2) #=> ["a","b","c"]
# p ["a","b","c","d","e"].slice(2..3)    #=> [2, 3]
# p ["a","b","c"].slice(2..3)    #=> ["c"]

# array = ["a", "b", "c", "b", "a"]
# p array.delete("b")       #=> "b"
# p array                 #=> ["a","c", "a"]
# str = "aiueo"
# p "==="
# p str.delete("a") #=>p "iueo"
# p str #=>p "aiueo"
# p str.delete!("a") #=>p "iueo"
# p str #=>p "iueo"
# input_line= "ruby"
# p input_line.slice("ru") #=>"ru"


# p "==="

# a = ["a", "b", "c", "b", "a"]
# p a.delete_at(1) #=>"b"
# p a # ["a", "c", "b", "a"]
# =====================================================-

# # ◆⭐️⭐️条件文（ifなど）と真偽値
# = falseとnil以外は真。数字や文字も真。なのでif 3 は真。

# なぜ(y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?なのか、trueとnilとかselfとか混在してないのか
# → (y % 100).nonzero? が300とかだったらnilを返し8とかだったら8を返す。8の場合は 8&&(y % 4).zero?で8 && trueになる。y==8ならtrue && trueでわかるけど、selfのままでいいのか？→self (8など)の部分はなんかそのままtrueになるっぽい
# * 要するに、わざわざif オブジェクト== tureとしなくていい。if オブジェクトでいい

# * 利用した例(13)
# ```
# 文字列の一致を確認する条件文
# str = gets.chomp
# input_line = gets.chomp

# if input_line.slice(str)
#    puts "OK!"
#   count = count + 1
#  else
#   puts "No!"
#  end

# →input_line.slice(str)が存在すれば　if trueになる。わざわざif input_line.slice(str) == tureとしなくていい
# ```


# ◆【削除系】slice,delete, delete_at 参照

# ◆【付随】【配列】uniq/uniq!
# =Uniq は配列から重複した要素を取り除いた新しい配列を返します。 uniq! は削除を破壊的に行い、削除が行われた場合は self を、そうでなければnil を返します。
# [Array#uniq (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/uniq.html)
# [Rubyのuniqメソッドとuniq!メソッドの使い方を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/19919)
# ```
# p [1, 1, 1].uniq         # => [1]
# p [1, 4, 1].uniq         # => [1, 4]
# p [1, 3, 2, 2, 3].uniq   # => [1, 3, 2]
# ```

# * ブロック
# ```
# ブロックが与えられた場合、ブロックが返した値が重複した要素を取り除いた配列を返します。
# p [1, 3, 2, "2", "3"].uniq                # => [1, 3, 2, "2", "3"]
# p [1, 3, 2, "2", "3"].uniq { |n| n.to_s } # => [1, 3, 2]
# 上記解説
# p [1, 3, 2, "2", "3"].map { |n| n.to_s } # => ["1", "3", "2", "2", "3"]となりその後uniqすると ["1", "3", "2"]→mapではないので実際にブロック内の内容に変化させないので["1", "3", "2"]でなく最初の[1, 3, 2]となる
# ```


