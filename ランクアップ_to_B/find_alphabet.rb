# <自分の答え>
alp_1 = gets.chomp.downcase
alp_2 = gets.chomp.downcase
alp_3 = gets.chomp.downcase
alp= ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
index_1 = alp.index(alp_1)
index_2 = alp.index(alp_2)
index_3 = alp.index(alp_3)
answer = "false"
alp[index_1..index_2].each do |a|
  if a == alp_3
    answer = "true"
  end
end
puts answer

# ==========================================
# # <解答>
# ```
# string = []
# 3.times do
#   string.push(gets.chomp)
# end

# puts string[0].ord <= string[2].ord && string[2].ord <= string[1].ord
# ```

# ==========================================
# # ◆indexメソッド
# ＝配列の要素の番号を取得、ない場合はnilを返す
# [Rubyのindexメソッドの使い方を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/19936)

# ```
# ●文字列
# s = "ROMACECARVSEMSEEXEGSE"
# p s.index("CE")
# #=> 4

# ●配列
# a = ["VSE", "MSE", "GSE", "EXE"]
# p a.index("GSE")
# #=> 2
# ```
# * 文字列にも配列にも使える
# * integerを返す

# ---
# # ◆ord、chr
# = １文字の文字列を整数に変換
# [RubyでIntegerと文字を相互変換する - Qiita](https://qiita.com/chezou/items/947900faef4c1032ed94)
# ```
# p "A".ord # => 65
# p 65.chr  # => "A"
# p "A".ord.chr # => "A"
# ```

# * Aは６５、Bは６６
# ---
# # ●puts 条件式がtrueならtrueと表示、falseならfalseと表示
# ```
# puts string[0].ord <= string[2].ord && string[2].ord <= string[1].ord
# ```