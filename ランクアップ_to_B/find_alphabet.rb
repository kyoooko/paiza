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