# <問題文>
# スペース区切りの2つの整数がn行与えられるので、2つの整数をそれぞれ足し合わせて、さらに、その結果をすべての行について足し合わせて出力してください。
# ただし、2つの整数が同じだった場合は、2つの整数を掛け合わせてから、その結果を足し合わせてください。

# ==============================================================================
# <自分の回答>
num = gets.to_i
sum = 0

num.times do
  int_1,int_2 = gets.split.map(&:to_i)
  if int_1 == int_2
    sum = sum + int_1 * int_2
  else
    sum = sum + int_1 + int_2
  end
end

puts sum
# ==========================================
# <解答(微妙)>
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

# →eachで回してi使ってないのでtimesの方がスマートだと思う

# ==========================================

# ◆「2 2」などを入力してそれぞれ変数に整数として代入する方法２つ
# ①paizaおなじみのint_1,int_2 = gets.split.map(&:to_i)

# ②array = gets.chomp.split(" ")とarray[0].to_i == array[1].to_i
