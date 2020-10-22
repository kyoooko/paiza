# <問題文>
# 改行区切りで整数がn個入力されるので、n個の整数のうち、5以上のものを全て足し合わせた値を出力してください。
# ==============================================================================
# <自分の回答>
input_num = gets.to_i
sum = 0
input_num.times do
  input =  gets.to_i
  sum = sum + input if input >= 5
end

puts sum
# ==========================================
# <解答>
# loop = gets.chomp.to_i
# ans = 0

# (1..loop).each { |i|
#     num = gets.chomp.to_i

#     if num >= 5 then
#         ans = ans + num
#     end
# }

# puts ans
