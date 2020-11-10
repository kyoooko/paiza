#  <問題文>
# 1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
# n 個の組を、「整数」の値で昇順に並べ変え、「文字」を出力してください。
# ==============================================================================
# <自分の回答（あきらめかけたができた）>
num = gets.to_i
hashes=[]
num.times do
  key,value = gets.chomp.split(' ')
   hash = {}
   hash[key] = value.to_i
   hash #{key1:value1}
  hashes << hash #[{A:1},{B:2},{A:3}]
end

#  できれば{key1:value1, key2:value2}で重複してるキーの値を足したいができない。①h1={A:1},h2={B:2,A:3}でh1.merge(h2)②[{A:1},{B:2},{A:3}]
merged_hashes = hashes.inject do |h1, h2|
  h1.merge(h2) do |key, oldval, newval|
    oldval + newval
  end
end
# p merged_hashes #{"A"=>4, "B"=>2}
merged_hashes = merged_hashes.sort_by { |_, v| v }.reverse.to_h #{"B"=>5, "A"=>1}

merged_hashes.each do |key, value|
  puts "#{key} #{value}"
end
# ==========================================
# <解答>
# num = gets.chomp.to_i
# array = {}

# (1..num).each do
#   values = gets.split(' ')  #["A","1"]
#   string = values[0]  #"A"
#   points = values[1].to_i.  #1

#   if array[string] #array[string]自体は{A:1}だったら1。重複があったら(既に存在してたら）true。{"A"=>4, "B"=>2}みたいにどんどん増えてく
#     current = array[string]
#     array[string] = current + points
#   else #重複がなかったらfalse。
#     array[string] = points
#   end
# end

# array = array.sort_by { |_string, points| -points }

# array.each do |string, points|
#   puts "#{string} #{points}"
# end

# ==========================================
# * 回答ではinjectやmerge使わずif 使ってる
# * 
# ==========================================
# # ◆ハッシュの重複するキーの値（数値）を合計する
# できれば{key1:value1, key2:value2}で重複してるキーの値を足したいができない。下記の方法しかない
# ```
# ①h1={A:1},h2={B:2,A:3}でh1.merge(h2)
# ②[{A:1},{B:2},{A:3}]
# ```
# 今回①のようにh1とh2で分断されてないので②でやった

# ⭐️[Ruby ｜配列内のハッシュを合体させる - Qiita](https://qiita.com/ddd555/items/8c5498bb288811ed198f)

# ```
# hash = [{a: 1},{b: 2},{b: 3},{c: 4}]

# merged_hash = hash.inject do |h1, h2|
#   h1.merge(h2) do |key, oldval, newval|
#     oldval + newval
#   end
# end

# p merged_hash
# #=> {:a=>1, :b=>5, :c=>4}
# ```

# * 値を合計するときただのh1.merge(h2)だと、h2の値に上書きされてしまうだけなので「h1.merge(h2) do |key, oldval, newval|　oldval + newval
#   end」が必要
# [キーが重複するハッシュをマージする - 明日の鍵](https://tomorrowkey.hatenablog.jp/entry/2015/11/12/103054)
# ```
# hash = [{a: 1},{b: 2},{b: 3},{c: 4}]

# merged_hash = hash.inject do |h1, h2|
#     h1.merge(h2) 
# end

# p merged_hash
# #=> {:a=>1, :b=>3, :c=>4}
# # :b=>5 になって欲しかった...
# ```
# # ◆merge
# * ハッシュ.merge
# [Ruby ｜配列内のハッシュを合体させる - Qiita](https://qiita.com/ddd555/items/8c5498bb288811ed198f)
# ```
# h1 = {a: 1, b: 2, c: 3, d: 4}
# h2 = {e: 5, f: 6}
# h3 = {a: 10, b: 20}

# p h1.merge(h2)
# # => {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6}

# p h1.merge(h3)
# # => {a: 11, b: 22, c: 3, d: 4}
# # 値が合算される
# ```
# # ◆inject
# * 配列.inject
# ```
# numbers = [1,2,3,4,5]

# numbers.inject do |n, m|
#     n + m
# end

# # or

# numbers.inject(&:+)

# # => 21

# ```
# ---
# # ◆*HashのValueを降順にソート*
# [RubyでHashのKey/Valueをソートする - Hack Your Design!](https://blog.toshimaru.net/ruby-hash-sort/)
# ```
# > h.sort_by { |_, v| v }.reverse.to_h
# => {:z=>10, :y=>5, :x=>1, :a=>-1, :b=>-5, :c=>-10}

# ```
