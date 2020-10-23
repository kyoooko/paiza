# <自分の解答>
# input_line = gets.chomp
# a,b = input_line.split.map(&:to_i)
# s = gets.chomp
# array = s.split('')

# p array[a-1..b-1] #=>["h", "e", "l"]
# p array[1] #=>"e"


#  p ans = array.map { |letter|
#   # p "hello" if letter in(array[a-1..b-1])
#   array[a-1..b-1].each do |l|
#     if l == letter
#       letter = l.upcase
#     end
#   end
# }

# できず

# ==========================================
# <解答>
num = gets.chomp.split(' ')
str = gets

first = num[0].to_i - 1
second = num[1].to_i - 1

(0...str.length).each {|n|
    if n >= first && n <= second
        p str[n].upcase
    else
        p str[n]
    end
}

# もしくは
# nums = gets.chomp.split(' ')
# str = gets.chomp

# (1..(str.size)).each do |i|
#   if nums[0].to_i <= i && i <= nums[1].to_i
#     print str[i - 1].upcase
#   else
#     print str[i - 1]
#   end
# end

# print "\n"


# →⭐️ポイントは①文字自体を回すのでなく文字数（length）を回す、私の方法だと文字が被ったときおかしくなるので文字自体の一致でなくあくまでも文字順に着目した方がいい→length使う発想②printで使うことでmapで回してjoinしたり代入の必要なし

# ==========================================

# ◆範囲 ..と…
# = 範囲オブジェクトは、 [Range.new](https://docs.ruby-lang.org/ja/latest/method/Range/s/new.html)  を用いるほか、範囲演算子（`..' または `...’）を用いた  [演算子式/範囲式](https://docs.ruby-lang.org/ja/latest/doc/spec=2foperator.html#range)  で生成できます。いずれの方法でも始端と終端を与えます。

# [class Range (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/class/Range.html)
# ```
# Range.new(1, 5) /# 1 以上 5 以下/
# 1..5            /# 同上/
# 1...5           /# 1 以上 5 未満/
# ```

# * ✅配列の範囲→配列で返される
# ```
#  input_line = gets.chomp
#  a,b = input_line.split.map(&:to_i)
#  s = gets.chomp
#  array = s.split('')

# # p array[a-1..b-1] #=>["h", "e", "l"] 配列で解される
# # p array[1] #=>"e"　要素で解される

# ```

# [Array#= (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/=5b=5d=3d.html)

# ---
# # ◆【文字列】大文字にするupcase
# [はじめてのRuby！文字列を大文字⇔小文字に変換する方法まとめ | 侍エンジニア塾ブログ（Samurai Blog） - プログラミング入門者向けサイト](https://www.sejuku.net/blog/60402)
# ```
# upcase 小文字を大文字に
# downcase 大文字を小文字に
# swapcase 小文字⇔大文字の変換
# capitalize 先頭の小文字を大文字に変換
# ```

# ---
# # ◆【文字列/配列】include?
# = 配列や文字列に該当の値や文字列が入っているかをtrue/falseで返す
# [Rubyでinclude?メソッドを使ってstringクラスを検索する方法を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/30844)
# ```
# 文字列
# puts "hello".include?("ell") #=> true

# 配列
# puts ["h", "e", "llo"].include?("llo") #=> true

# ```
# ---
# # ◆ 【配列】includeとin?
# [ruby — Rubyの配列に値が存在するか確認する](https://www.it-swarm-ja.tech/ja/ruby/ruby%E3%81%AE%E9%85%8D%E5%88%97%E3%81%AB%E5%80%A4%E3%81%8C%E5%AD%98%E5%9C%A8%E3%81%99%E3%82%8B%E3%81%8B%E7%A2%BA%E8%AA%8D%E3%81%99%E3%82%8B/968672730/)
# = include?は配列の中に該当の値が入っているかをtrue/falseで返す
# = in?は配列の中にその値があるかをtrue/falseで返す
# ```
# ['Cat', 'Dog', 'Bird'].include?('Unicorn') # => false

# 'Unicorn'.in?(['Cat', 'Dog', 'Bird']) # => false
# ```

# * 【include?/any?応用】複数の文字列のいずれかが含まれているかどうかを確認するスクリプト
#  [RubyにおけるArrayとanyを使った条件チェック - Qiita](https://qiita.com/TanakanoAnchan/items/30a9b5436a47568d37b6)
# ```
# url = 'https://google.co.jp'
# conditions = %w(google yahoo amazon) # ①配列の作成

# if conditions.any? {|condition| url.include? condition} # ②条件判定
#   puts '条件に該当するリンクです'
# elsif
#   puts 'このリンクは条件に該当しません'
# end

# ```
# ---
