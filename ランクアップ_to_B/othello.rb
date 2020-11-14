#  <問題文>
# 5行5列の五目並べの盤面が与えられます。盤面の各マスには、"O"か"X"か"."が書かれています。"O"と"X"は、それぞれプレイヤーの記号を表します。同じ記号が縦か横か斜めに連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。勝者の記号を1行で表示してください。勝者がいない場合は、引き分けとして、"D"を表示してください。
# ==============================================================================
# <自分の回答（何とかかんとかできた）>
ans = []
rows = []
5.times do
  row = gets.chomp.split('') #["o", "o", "o", "o", "x"]
  rows << row
  # これが完成形（横：rows )
  #[["o", "o", "o", "o", "x"],
  # ["x", "x", "x", "x", "x"],
  # ["o", "x", "o", "x", "x"],
  # ["x", "o", "x", "o", "x"],
  # ["o", "o", "o", "x", "x"]]
end
# p rows
# 横並び
rows.each do |row|
  ans << row[0] if row.uniq.count == 1 # "x"
end

#縦並び
col_0 =[]
col_1 =[]
col_2 =[]
col_3 =[]
col_4 =[]

rows.each do |row|
  col_0 << row[0] #["x", "o", "o", "x", "o"] 縦１行目
  col_1 << row[1] #["x", "o", "x", "o", "o"]
  col_2 << row[2] #["x", "o", "o", "x", "o"]
  col_3 << row[3] #["x", "o", "x", "o", "x"]
  col_4 << row[4] #["x", "x", "x", "x", "x"]
end

cols = []
cols.push(col_0, col_1,col_2,col_3,col_4)
# これを90度回転させて見る(縦：cols)
#[["o", "x", "o", "x", "o"],
# ["o", "x", "x", "o", "o"],
# ["o", "x", "o", "x", "o"],
# ["o", "x", "x", "o", "x"],
# ["x", "x", "x", "x", "x"]]
cols.each do |col|
  ans << col[0] if col.uniq.count == 1 #"x"
end

# 斜め(1)
  # rows = [["x", "o", "o", "o", "x"],
  # ["x", "x", "x", "x", "x"],
  # ["o", "x", "x", "x", "x"],
  # ["x", "o", "x", "x", "x"],
  # ["o", "o", "o", "x", "x"]]

 diagonals_1 =[]
 diagonals_1 = diagonals_1.push(rows[0][0],rows[1][1],rows[2][2],rows[3][3],rows[4][4] )# ["x", "x", "x", "x", "x"]

ans << diagonals_1.uniq if diagonals_1.uniq.count == 1

 # 斜め(2)
  # rows = [["o", "o", "o", "o", "o"],
  # ["x", "x", "x", "o", "x"],
  # ["o", "x", "o", "x", "x"],
  # ["x", "o", "x", "x", "x"],
  # ["o", "o", "o", "x", "x"]]
  diagonals_2 =[]
  diagonals_2 = diagonals_2.push(rows[0][4],rows[1][3],rows[2][2], rows[3][1] ,rows[4][0]  )# ["o", "o", "o", "o", "o"]
  ans << diagonals_2.uniq if diagonals_2.uniq.count == 1

# これできない! A == B && B == Cとかにする
#   if (rows[0][0] == rows[1][1] == rows[2][2] == rows[3][3] == rows[4][4] )

if ans[0] == "." #全て.パターンを除外する
  puts "D"
elsif ans[0]
  puts ans[0]
else
  puts "D"
end

# ==========================================
# <解答>

# $board = []

# # 盤面の初期化
# (1..5).each { $board.push(gets.chomp.split('')) }

# # p $board 
# #[["o", "o", "o", "x", "x"], ["x", "x", "o", "x", "x"], ["o", "x", "o", "x", "x"], ["x", "x", "o", "x", "o"], ["o", "o", "x", "x", "x"]]
# # gets.chomp.split('')自体が配列["o", "o", "o", "x", "x"]。自分とやってること同じ

# def aligned?(o, x)
#   if o == 5
#     'O'
#   elsif x == 5
#     'X'
#   else
#     'D'
#   end
# end

# # 横
# def row_aligned?
#   result = ''
#   # 二次元配列
#   # rowは["o", "o", "o", "x", "x"]
#   $board.each do |row|
#     o = 0
#     x = 0

#     (0..4).each do |i|
#       if row[i] == 'O'
#         o = o + 1
#       elsif row[i] == 'X'
#         x = x + 1
#       else
#         # .が一つでも入ったら横で並ぶことはないのでやめる
#         break
#       end
#     end

#     result = aligned?(o, x)
#     # 揃うとしたら１回のみというルールなのでここでやめる
#     break if result != 'D'
#   end
#   # row_aligned?メソッドはresultを返す
#   result
# end

# # 縦
# def collum_aligned?
#   result = ''

#   # ここで$board.each do |row|ではない
#   (0..4).each do |i|
#     o = 0
#     x = 0
#     # 番号が0のrowを調べる→番号が1のrowを調べる...
#     $board.each do |row|
#       if row[i] == 'O'
#         o = o + 1
#       elsif row[i] == 'X'
#         x = x + 1
#       end
#     end

#     result = aligned?(o, x)
#     break if result != 'D'
#   end

#   result
# end

# # 斜め
# # なんとなくやりたいことわかるけどわからない
# def oblique_aligned?
#   result = ''
#   (0..1).each do |time|
#     i = 0
#     # 自身がゼロの時、trueを返します。そうでない場合は false を返します。
#     if time.zero?
#       j = 0
#     else
#       j = 4
#     end

#     o = 0
#     x = 0
#     (1..5).each do
#       if $board[i][j] == 'O'
#         o = o + 1
#       elsif $board[i][j] == 'X'
#         x = x + 1
#       end

#       i = i + 1

#       if time.zero?
#         j = j + 1
#       else
#         j = j - 1
#       end
#     end

#     result = aligned?(o, x)
#     break if result != 'D'
#   end

#   result
# end

# if row_aligned? == 'O' || collum_aligned? == 'O' || oblique_aligned? == 'O'
#   puts 'O'
# elsif row_aligned? == 'X' || collum_aligned? == 'X' || oblique_aligned? == 'X'
#   puts 'X'
# else
#   puts 'D'
# end
# ==========================================
# 二次元配列とは配列の中に配列入ってるもの
# ◆【当たり前だが】if A==B==C==Dできない。 A == B && B == Cとかにする
# ◆配列の値が全て同一かを確認する方法
# [rubyで3つの値が同一かを確認する方法 - Qiita](https://qiita.com/sukechansan/items/a7eb361298303b3c305e)
# ```
# a = 1
# b = 1
# c = 1
# array=[a, b, c]
# array.uniq.count == 1

# ●それを表示するなら
# puts array[0] if array.uniq.count == 1
# ```

# # ◆ 配列に複数の値を追加
# [Rubyで配列に要素を追加・挿入する：push, insert, unshift | UX MILK](https://uxmilk.jp/21132)
# ```
# a = [1, 2, 3]
# a.push(4, 5)
# print a # [1, 2, 3, 4, 5]
# ```

# # ◆.any?
# [はじめてのRuby！any?メソッドの使い方をマスターしよう！ | 侍エンジニア塾ブログ（Samurai Blog） - プログラミング入門者向けサイト](https://www.sejuku.net/blog/58980)
# * *ブロックの省略*
# =ブロックを省略した場合は、*要素の中に真の値が存在すればtrueを返します。*
# ```
# 1. array1 = [*nil*, *nil*, *nil*, 100, *nil*]
# 2. array2 = [*false*, *true*, *false*]
# 3.  
# 4. puts array1.any?
# 5. puts array2.any?

# ### 実行結果：
# *1.* *true*
# 2. ture

# ```

# ---
# # ◆グローバル変数$
# =*"そのプロジェクト内、どこでも使用できる変数"*のことです！
# どこで定義しても、どこからでも使用できる変数です。
# 一見とても便利ですが、どこでも使えてしまうからには一意である必要があります。
# どこかで変数名が被ってしまうとエラーの原因になります。
# ```
# $board
# ```
# [【Ruby】変数の種類と違い(グローバル変数・ローカル変数・インスタンス変数) - Qiita](https://qiita.com/tomokichi_ruby/items/a2548176d85457f622a4)
# ---
# # ◆配列の番号を回す
# できないと思って変数=[]を定義して<< で配列作って変数[]をするしかないと思ってたけど下記の方法あった
# ```
# (0..4).each do |i|
#       if row[i] == 'O'
#         o = o + 1
#       elsif row[i] == 'X'
#         x = x + 1
#       else
#         break
#       end
#     end
# ```
# ---
# ●def ~endでメソッドを作ってくパターン