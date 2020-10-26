# p [1, 1, 1].uniq         # => [1]
# p [1, 4, 1].uniq         # => [1, 4]
# p [1, 3, 2, 2, 3].uniq   # => [1, 3, 2]

# p [1, 3, 2, "2", "3"].uniq                # => [1, 3, 2, "2", "3"]
# p [1, 3, 2, "2", "3"].uniq { |n| n.to_s } # => [1, 3, 2]
# p [1, 3, 2, "2", "3"].map { |n| n.to_s } # => [1, 3, 2]

# 文字列をhashにする
# a = "Hello World!"
# def to_hash(str)
#   eval("{#{str}}")
# end

# p to_hash(a)


# p eval("a")

# [キー, 値, ...] の配列からハッシュへ
ary = [1,"a", 2,"b", 3,["c"]]
p Hash[*ary]

# hash = {"kato" => 30, "Sato" => 25}
# p hash[0]
# p hash[1]
# p hash["kato"]

hash = {}
p hash[30] = "kato"   #=>"kato"
p hash[30]  #=>"kato"
p hash #=>{30=>"kato"}