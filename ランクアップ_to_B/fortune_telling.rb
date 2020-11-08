# <問題文>
# 次のような占いプログラムを作成してください。

# 「ユーザー」と「ユーザーに対応する血液型」、「血液型」と「血液型に対応する占い結果」が与えられます。

# それぞれのユーザーに対応する占い結果を表示してください。

# 入力例の1つ目は、ユーザーの血液型についてのラッキーカラーの占いです。

# 入力例の2つ目は、ユーザーの星座についてのラッキーパーソンの占いになっています。
# 「血液型」として「星座」などのさまざまな文字列を利用できるようにすることで、他の占いにも対応する必要があることに注意してください。

# ==============================================================================
# <自分の回答>
num_1 = gets.chomp.to_i
input_line_array_1 = []
num_1.times do
  input_line_array_1 << gets.chomp.split(' ') #[["kyoko", "AB"], ["fuji", "A"]]
end
hash_1 = input_line_array_1.to_h #{"Kyoko"=>"AB", "fuji"=>"A"}

num_2 = gets.chomp.to_i
input_line_array_2 = []
num_2.times do
  input_line_array_2 << gets.chomp.split(' ')
end
hash_2 = input_line_array_2.to_h

hash_1.each do |key_1,value_1|
  key = key_1
  hash_2.each do |key_2,value_2|
    if value_1 == key_2
      value = value_2
      puts "#{key} #{value}" # p key + " " + valueと同じ
    end
  end
end
# ==========================================
# <解答>
# n = gets.chomp.to_i
# user2blood = {} #{}
# (1..n).each do
#   user, blood = gets.chomp.split(' ')
#   user2blood[user] = blood #{"kyoko"=>"AB", "fuji"=>"A"}
# end

# m = gets.chomp.to_i
# blood2result = {}
# (1..m).each do
#   blood, result = gets.chomp.split(' ')
#   blood2result[blood] = result #{"AB"=>"pink", "A"=>"green"}
# end

# users = user2blood.keys #["kyoko", "fuji"]
# users.each do |user|
#   blood = user2blood[user]
#   result = blood2result[blood]
#   puts "#{user} #{result}"
# end


# ==========================================
# # ◆eachの対象は配列だけでなく範囲やハッシュでもOK
# [ハッシュに対する繰り返し - ハッシュ - Ruby入門](https://www.javadrive.jp/ruby/hash/index7.html)
# * ハッシュの場合、each_keyメソッド、each_valueメソッドもある
# ```
# ●hash
# hash = {"Lemon" => 100, "Orange" => 150}

# hash.each{|key, value|
#   print(key + "=>", value)
# }

# ```
# ---
# # ◆ハッシュオブジェクトからキーや値を配列として取り出す方法(keys,values,to_a)
# [Rubyでハッシュオブジェクトからキーや値を取り出す方法【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/19786)
# * キー
# ```
# key = hash.keys

# #=> keyという変数にハッシュオブジェクトから取り出したキーを代入

# p key  #=> keyの内容を表示してみましょう!!

# #=> ["経済学", "財政学", "会計学"] のように配列で表示されます。

# ```
# * 値
# ```
# value = hash.values

# #=> valueという変数にハッシュオブジェクトから取り出した値を代入

# p value   #=> valueの内容を表示してみましょう!!

# #=>  [80, 70, 60]のように配列で表示されます。

# ```
# * 両方
# ```
# array = hash.to_a

# #=> arrayという変数にハッシュオブジェクトから取り出したキーと値を代入

# p array    #=> arrayの内容を表示してみましょう!!

# #=>  [["経済学", 80], ["財政学", 70], ["会計学", 60]]

# のように配列で表示されます。

# ```

# ---
# # ◆文字列をハッシュにする
# * 方法A（自分）
# [Array#to_h (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/to_h.html)

# ＝文字列→配列→to_hでハッシュ
# ```
# [[:foo, :bar], [1, 2]].*to_h* /# => {:foo => :bar, 1 => 2}/
# ```

# ```
# num_1 = gets.chomp.to_i
# input_line_array_1 = []
# num_1.times do
#   input_line_array_1 << gets.chomp.split(' ') #[["k1", "v1"], ["k2", "v2"]]
# end
# hash_1 = input_line_array_1.to_h #{"k1"=>"v1", "k2"=>"v2"}

# ```

# * 方法B（回答）
# =文字列→ハッシュ
# （user, blood = gets.chomp.split(' ‘)でキーになるものと値になるものを変数それぞれに代入してハッシュ[キー]＝値を使う）
# ```
# n = gets.chomp.to_i
# user2blood = {} #{}
# (1..n).each do
#   user, blood = gets.chomp.split(' ')
#   user2blood[user] = blood #{"kyoko"=>"AB", "fuji"=>"A"}
# end
# ```

