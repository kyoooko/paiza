# # <問題文>難
# # 1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
# # n 個の組を、「整数」の値で昇順に並べ変え、「文字」を出力してください。
# # ==============================================================================
# # <自分の回答>
# pattern = gets.to_i
# array=[]
# pattern.times do
#   string = gets.chomp
#   # まだどちらも文字列
#   p array = array << string.split(' ').map {|k, v| [k.to_sym, v.to_i] }.to_h 
#   # string.split(' ')は[E,-2]など
# end


# p "============"
# # array = [
# #   {str: "G", int: 0},
# #   {str: "S",int: 3},
# #   {str: "E", int: -2}
# # ]

# array = array.sort do |a, b|
#   a[:int] <=> b[:int]
# end
# # pp (hash = hash.sort do |a, b|
# #   a[:int] <=> b[:int]
# # end)
# # 下記と同じ(ppはpを見やすく表示するver.)
# # data.sort do |a, b|
# #   b[:id] <=> a[:id]
# # end
# # p data

# ◆ppの場合
# [{:id=>4, :name=>"佐藤", :ruby=>"sato"},
#  {:id=>3, :name=>"吉田(B)", :ruby=>"yoshida"},
#  {:id=>2, :name=>"鈴木", :ruby=>"suzuki"},
#  {:id=>1, :name=>"吉田(A)", :ruby=>"yoshida"}]
# ◆pの場合
# [{:id=>1, :name=>"吉田(A)", :ruby=>"yoshida"}, {:id=>4, :name=>"佐藤", :ruby=>"sato"}, {:id=>3, :name=>"吉田(B)", :ruby=>"yoshida"}, {:id=>2, :name=>"鈴木", :ruby=>"suzuki"}]

# array.each do |w|
#  puts w[:str]
# end

# # できず

# ==========================================
# <解答>
num = gets.chomp.to_i
hash = {}

(1..num).each do
  p line = gets.chomp.split(' ') #＝＞["A", "3"]と["B", "0"]
  p hash[line[1].to_i] = line[0] #＝＞"A"と"B"
  p hash #=>{3=>"A"}と{3=>"A", 0=>"B"}
end
p "================="
p array = hash.sort #=>[[0, "B"], [3, "A"]]
# ハッシュを [key, value] を要素とする配列の配列に変換して，それをソートした配列を返します。
# https://docs.ruby-lang.org/ja/latest/method/Hash/i/sort.html

array.each do |ele|
  puts ele[1]
end

# ⭐️ポイント①「ハッシュ.sort」で[key, value] を要素とする配列の配列に変換して，それをソートした配列を返す性質を利用する
# ②それを踏まえ、{3=>"A", 0=>"B"}のようなハッシュを作る必要がある。hash = {} 、hash[keyになる値] = valueになる値でハッシュを作れるのでまずは配列["A", "3"]などを作った上でhashにする

# ==========================================
# * ✅数値.eachか数値.timesか
# =「|n|のないeach 」= times
# ```
# pattern = gets.to_i
# array=[]
# pattern.times do
#  ~~~
# end
# =======================
# num = gets.chomp.to_i
# hash = {}
# (1..num).each do
#  ~~~
# end

# #→timesの方がいいじゃん感
# ```

# = eachは回した数値iを使いたいとき、timesは回した数値iを使わないとき

# ```
# num = gets.to_i
# sum = 0

# num.times do
#   int_1,int_2 = gets.split.map(&:to_i)
#   if int_1 == int_2
#     sum = sum + int_1 * int_2
#   else
#     sum = sum + int_1 + int_2
#   end
# end

# puts sum

# ========================================================
# count = gets.chomp.to_i
# sum = 0

# (1..count).each { |i|
#     line = gets.chomp.split(" ")
#     if line[0].to_i == line[1].to_i
#         sum += line[0].to_i * line[1].to_i
#     else
#         sum += line[0].to_i + line[1].to_i
#     end
# }

# puts sum

# # →eachで回してi使ってないのでtimesの方がスマートだと思う
# ```

# ---
# # ◆pp
# Pを見やすくしてくれる(Pと同じくエンジニアデバック用）
# [【ruby】p pp puts print　違い。 - Qiita](https://qiita.com/Takahashiq/items/f5d84581d3a301a9c22f)
# ```
# ◆ppの場合
# [{:id=>4, :name=>"佐藤", :ruby=>"sato"},
#  {:id=>3, :name=>"吉田(B)", :ruby=>"yoshida"},
#  {:id=>2, :name=>"鈴木", :ruby=>"suzuki"},
#  {:id=>1, :name=>"吉田(A)", :ruby=>"yoshida"}]

# ◆pの場合
# [{:id=>1, :name=>"吉田(A)", :ruby=>"yoshida"}, {:id=>4, :name=>"佐藤", :ruby=>"sato"}, {:id=>3, :name=>"吉田(B)", :ruby=>"yoshida"}, {:id=>2, :name=>"鈴木", :ruby=>"suzuki"}]
# ```
# ---
# # ◆⭐️そもそものハッシュの作り方
# Hash = {} , hash[keyになる値] = valueになる値でハッシュを作れる
# ```
# hash = {}
# p hash[30] = "kato"   #=>"kato"
# p hash[30]  #=>"kato"
# p hash #=>{30=>"kato"}
# ```
# →まあ確かにそりゃそうだわ

# # ◆⭐️hashから配列を作る→さらにはsort
# * 「ハッシュ.sort」で[key, value] を要素とする配列の配列に変換できる
#  [Hash#sort (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Hash/i/sort.html)
# ```
# h = { "a" => 20, "b" => 30, "c" => 10  }
# h.sort                       #=> [["a", 20], ["b", 30], ["c", 10]]
# h.sort {|a,b| a[1]<=>b[1]}   #=> [["c", 10], ["a", 20], ["b", 30]]
# ```

# # ◆【付随】配列からハッシュを作る方法
# * hashは*連想配列*という


# * [キー, 値,キー, 値,キー, 値, …] の配列からハッシュへ
#  [class Hash (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/class/Hash.html)
# ```
# ary = [1,"a", 2,"b", 3,["c"]]
# p Hash[*ary]  # => {1=>"a", 2=>"b", 3=>["c"]}
# ```

# * [【Ruby】Array から Hash を作る方法７選（a.k.a. やっぱり Array#zip はかわいいよ） | Raksul ENGINEERING](https://tech.raksul.com/2018/02/06/ruby_array_to_hash/)


# # ◆【付随】文字列からハッシュを作る方法
# [Ruby 文字列をハッシュに変換 - Qiita](https://qiita.com/uplus_e10/items/65a50935250639bf8308)

# [Ruby - Rubyで文字列をハッシュに変換する方法がわかりません、、｜teratail](https://teratail.com/questions/82955)

# ---
# # 【付随】<=> 演算子
# = 0か−１か１かnilを返す

# [Ruby の <=> 演算子が返す値を覚える方法 - Qiita](https://qiita.com/takuya0301/items/364f2b3f7ba2c36e0f62)
# ```
# 10 <=> 20   #  -1
# 20 <=> 10   #   1
# 20 <=> 20   #   0
# 20 <=> ’20’ # nil
# ```
# * 配列バージョン
#  [Array#<=> (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/=3c=3d=3e.html)
# ```
# [ 1, 2, 3 ] <=> [ 1, 3, 2 ]       #=> -1
# [ 1, 2, 3 ] <=> [ 1, 2, 3 ]       #=> 0
# [ 1, 2, 3 ] <=> [ 1, 2 ]          #=> 1
# ```

# ---
# # ◆sort (順番ならびかえ)
# ⭐️[Rubyのsortとsort_byを理解してマルチソートをしよう - Qiita](https://qiita.com/zom/items/b22510a86ef63b18af00)

# * 配列.sort
# ```
# data = (1..10).to_a.shuffle
# p data.sort # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# ===別の例==================================
# ary2 = ["9", "7", "10", "11", "8"]
# p ary2.sort                             #=> ["10", "11", "7", "8", "9"] (文字列としてソートするとこうなる)
# p ary2.sort{|a, b| a.to_i <=> b.to_i }  #=> ["7", "8", "9", "10", "11"] (ブロックを使って数字としてソート)

# ```

# [Array#sort (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/sort.html)

# * ⭐️hashから配列を作りさらにはsort
# 「ハッシュ.sort」で[key, value] を要素とする配列の配列に変換できる
#  [Hash#sort (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Hash/i/sort.html)
# ```
# h = { "a" => 20, "b" => 30, "c" => 10  }
# h.sort                       #=> [["a", 20], ["b", 30], ["c", 10]]
# h.sort {|a,b| a[1]<=>b[1]}   #=> [["c", 10], ["a", 20], ["b", 30]]
# ```


# * [ハッシュ,ハッシュ…].sort
# ```
# require 'date'
# data = [
#   {id: 1, name: '吉田(A)', ruby: 'yoshida', join_date: Date.new(2009, 4, 1)},
#   {id: 2, name: '鈴木', ruby: 'suzuki', join_date: Date.new(2015, 4, 1)},
#   {id: 3, name: '吉田(B)', ruby: 'yoshida', join_date: Date.new(2009, 4, 1)},
#   {id: 4, name: '佐藤', ruby: 'sato', join_date: Date.new(2006, 10, 1)},
#   {id: 5, name: '田中', ruby: 'tanaka', join_date: Date.new(2009, 4, 1)},
# ]

# 数字の降順で並び替える
# pp (data.sort do |a, b|
#   b[:id] <=> a[:id]
# end)

# 文字列の昇順
# pp (data.sort do |a, b|
#   a[:ruby] <=> b[:ruby]
# end)
# ```

# * orderはどっちかっていうとrailsらしい



