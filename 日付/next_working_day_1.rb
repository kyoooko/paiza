# <問題文>
# ```
# M月D日d曜日の翌営業日の日付を表示してください。営業日には、次のルールがあります。・営業日は、月曜日から金曜日とし、休業日は、土曜日と日曜日とします。・休業日は土曜日と日曜日のみです。例えば、祝日の「海の日」は月曜日ですが、営業日とします。日付には、次のルールがあります。・全ての年の2月28日の翌日は、3月1日とします。うるう年は考慮しません。
# ```

# ==============================================================================
# <自分の回答>
input_line = gets
array = input_line.split

# 下記の代わりにarray.slice(0)やarray.slice(1)でも良い
M = array[0].to_i
D = array[1].to_i
d = array[2]

FINAL_DAYS = [[1,31],[2,28],[3,31],[4,30],[5,31],[6,30],[7,31],[8,31],[9,30],[10,31],[11,30]]
# 下記のような方法でも可能
# final_day_of_year = [12,31]
# final_days.each do |final_day|
#   M,D = M+1,1 if [M,D] == final_day
# end

# 大文字はグローバル変数。メソッド外で定義しても使える。小文字の場合はローカル変数なのでメソッド内で定義しないと使えない。
# 引数にグローバル変数は入らない

def next_1day
  case [M,D]
  when [12, 31]
    [1, 1]
  when *FINAL_DAYS
    [M+1,1]
  else
    [M,D+1]
  end
end

def next_2day
  case [M,D]
  when [12, 31]
    [1, 2]
  when *FINAL_DAYS
    [M+1,2]
  else
    [M,D+2]
  end
end

def next_3day
  case [M,D]
  when [12, 31]
    [1, 3]
  when *FINAL_DAYS
    [M+1,3]
  else
    [M,D+3]
  end
end

# 下記のように記述して実行前にday=day+2とするのは2,28が与えられないので正しい結果を求められない
# def next_1day(month,day)
#   case [month, day]
#   when [12, 31]
#     [1, 1]
#   when *FINAL_DAYS
#     [month+1,1]
#   else
#     [month,day+1]
#   end
# end


# next_1day(M,D)は配列。puts "%d月%d日" % [1,1]のような感じ
case d  when "MON"
        puts "%d月%d日" % next_1day
        when "TUE"
        puts "%d月%d日" % next_1day
        when "WED"
        puts "%d月%d日" % next_1day
        when "THU"
        puts "%d月%d日" % next_1day
        when "FRI"
        # 3日
        puts "%d月%d日" % next_3day
      when "SAT"
        # 2日
        puts "%d月%d日" % next_2day
      when "SUN"
        puts "%d月%d日" % next_1day
end

# ===============================================================-
# ❓<解答>
# END_OF_MONTH = [
#   [1, 31],
#   [2, 28],
#   [3, 31],
#   [4, 30],
#   [5, 31],
#   [6, 30],
#   [7, 31],
#   [8, 31],
#   [9, 30],
#   [10, 31],
#   [11, 30]
# ]

# WEEK_DAYS = {
#   'MON' => 0,
#   'TUE' => 1,
#   'WED' => 2,
#   'THU' => 3,
#   'FRI' => 4,
#   'SAT' => 5,
#   'SUN' => 6
# }

# def next_day(m, d, day_of_week)
#   next_m, next_d =
#     case [m, d]
#     when [12, 31]
#       [1, 1]
#     when *END_OF_MONTH
#       [m + 1, 1]
#     else
#       [m, d + 1]
#     end
#   [next_m, next_d, (day_of_week + 1) % 7]
# end

# month, day, week_day = gets.chomp.split

# m = month.to_i
# d = day.to_i
# day_of_week = WEEK_DAYS[week_day]

❓
# begin
#   m, d, day_of_week = next_day(m, d, day_of_week)
# end until day_of_week < 5

# puts "#{m}月#{d}日"


# ==========================================
# # ◆✅グローバル変数とローカル変数
# [引数に大文字はダメなのか。 — mkouhei’s blog](https://d.palmtb.net/2007/11/02/014112.html)
# * 大文字はグローバル変数。メソッド外で定義しても使える。小文字の場合はローカル変数なのでメソッド内で定義しないと使えない。
# * 引数にグローバル変数は入らない(def next_1day(M,D)はできない)
# ```
# グローバル変数
# M = array[0].to_i
# D = array[1].to_i
# ローカル変数
# d = array[2]

# グローバル変数
# FINAL_DAYS = [[1,31],[2,28],[3,31],[4,30],[5,31],[6,30],[7,31],[8,31],[9,30],[10,31],[11,30]]

# def next_1day
#   case [M,D]
#   when [12, 31]
#     [1, 1]
#   when *FINAL_DAYS
#     [M+1,1]
#   else
#     [M,D+1]
#   end
# end

# #もしくは
# # def next_1day(month,day)
# #   case [month, day]
# #   when [12, 31]
# #     [1, 1]
# #   when *FINAL_DAYS
# #     [month+1,1]
# #   else
# #     [month,day+1]
# #   end
# # end

# ```

# # ●[]のエイリアス＝slice
# 下記の代わりにarray.slice(0)やarray.slice(1)でも良い
# ```
# M = array[0].to_i
# D = array[1].to_i
# d = array[2]
# ```

# # ● `"%d月%d日 " % next_1day`
# next_1day(M,D)は配列。`"puts %d月%d日 " % [1,1]`のような感じ


# # ●【頻出】(day_of_week + 1) % 7は頭に戻るため
# %7しないと
# SUNは７になっちゃう

# ```
# WEEK_DAYS = {
#   'MON' => 0,
#   'TUE' => 1,
#   'WED' => 2,
#   'THU' => 3,
#   'FRI' => 4,
#   'SAT' => 5,
#   'SUN' => 6
# }

# def next_day(m, d, day_of_week)
#   next_m, next_d =
#     case [m, d]
#     when [12, 31]
#       [1, 1]
#     when *END_OF_MONTH
#       [m + 1, 1]
#     else
#       [m, d + 1]
#     end
#   [next_m, next_d, (day_of_week + 1) % 7]
# end
# ```

# # ◆begin ~ end ~until
# [Ruby： while修飾子／until修飾子／while文／until文 ― ちょっと便利な繰り返し処理の構文とは？（1） - Build Insider](https://www.buildinsider.net/language/rubytips/0009)
# * until
# =条件式が”真”になるまで、繰り返し処理が実行されます。
# [【Ruby入門】Rubyの繰り返し : until文 | UX MILK](https://uxmilk.jp/17480)

# * while
# =条件式が真(true)の間は繰り返し実行されます。実際の実行される流れは次のようになります。

# * 後置untilは条件に関わらず一回目は実行する
# ```
# Puts « 前判断型の場合 »
# i = 10
# puts I += 2 while I < 10

# Puts « 後判断型の場合 »
# i = 10
# begin puts I += 2 end while I < 10


# $ ruby sample004.rb
# 前判断型の場合
# 後判断型の場合
# 12

# ```









