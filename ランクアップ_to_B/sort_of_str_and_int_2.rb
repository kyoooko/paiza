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

# ==========================================
