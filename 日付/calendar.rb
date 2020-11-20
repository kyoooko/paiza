# <自分の回答>
# 閏年
def uruudoshi?(y)
  (y%400).zero? || (y%100).nonzero? && (y%4).zero?
end

# DAYS_OF_WEEK = %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日]
y,m = gets.chomp.split(' ').map(&:to_i)

# 1日が何曜日なのか
adjust_by_month = [0, 1,-1,0,0,1,1,2,3,3,4,4]
# 閏年の数
leap_years = (y / 4 - y / 100 + y / 400)
# 何日目か
days = 365 * y + leap_years
days += (m - 1) * 30 + 1 - 1 + adjust_by_month[m - 1]
# 何日目か
days -= 1 if uruudoshi?(y) && m < 3
# 日曜が0~土曜日が6（ここだけ変更、便宜上数字のままにしとく）
days_of_the_week = days % 7


case m
when 4,6,9,1 then #30
  # ◆[1,2,3,4,5...30]という数値の配列を作る
  # n = 1
  # calendar = []
  # 30.times do
  #   calendar << n+=1
  # end
  # 上記をcalendar = (10..30).map{|d| d}で書ける
  # ◆一桁の場合半角考慮なので下記（[' 1',' 2',' 3'...'30']という文字列を作る）
  calendar = [' 1',' 2',' 3',' 4',' 5',' 6',' 7', ' 8',' 9']
  calendar = calendar + (10..30).map(&:to_s)
  case days_of_the_week
  when 0 # 日
    calendar.push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 1 # 月
    calendar.unshift('  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 2 # 火
    calendar.unshift('  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 3 # 水
    calendar.unshift('  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 4 # 木
    calendar.unshift('  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ')
  when 5 # 金
    calendar.unshift('  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ')
  when 6 # 土
    calendar.unshift('  ','  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ')
  end
when 2
  if uruudoshi?(y) #29
    calendar = [' 1',' 2',' 3',' 4',' 5',' 6',' 7', ' 8',' 9']
    calendar = calendar + (10..29).map(&:to_s)
    case days_of_the_week
    when 0 # 日
      calendar.push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 1 # 月
      calendar.unshift('  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 2 # 火
      calendar.unshift('  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 3 # 水
      calendar.unshift('  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 4 # 木
      calendar.unshift('  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 5 # 金
      calendar.unshift('  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ')
    when 6 # 土
      calendar.unshift('  ','  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ')
    end
  else
    calendar = [' 1',' 2',' 3',' 4',' 5',' 6',' 7', ' 8',' 9']
    calendar = calendar + (10..28).map(&:to_s) #28
    case days_of_the_week
    when 0 # 日
      calendar.push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 1 # 月
      calendar.unshift('  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 2 # 火
      calendar.unshift('  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 3 # 水
      calendar.unshift('  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 4 # 木
      calendar.unshift('  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 5 # 金
      calendar.unshift('  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ')
    when 6 # 土
      calendar.unshift('  ','  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ')
    end
  end
else #31
  calendar = [' 1',' 2',' 3',' 4',' 5',' 6',' 7', ' 8',' 9']
  calendar = calendar + (10..31).map(&:to_s)
  case days_of_the_week
  when 0 # 日
    calendar.push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 1 # 月
    calendar.unshift('  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 2 # 火
    calendar.unshift('  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ','  ')
  when 3 # 水
    calendar.unshift('  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ','  ')
  when 4 # 木
    calendar.unshift('  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ','  ')
  when 5 # 金
    calendar.unshift('  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ','  ')
  when 6 # 土
    calendar.unshift('  ','  ','  ','  ','  ','  ').push('  ','  ','  ','  ','  ')
  end
end

# この時点でcalendarは[' ',' ',' ',' ',' ',' 1',' 2',' 3',' 4',' 5',' 6',' 7', ' 8'...' 30',' ',' ',' ']のような感じ
calendar.each_slice(7) {|d|
puts d.join(' ')
}
# ===========================================
# ＜解答＞
# def is_leap?(y)
#   (y % 400).zero? || (y % 100).nonzero? && (y % 4).zero?
# end

# y, m = gets.split.map(&:to_i)

# cal =
#   case m
#   when 2
#     is_leap?(y) ? [*1..29] : [*1..28]
#   when 4, 6, 9, 11
#     [*1..30]
#   else
#     [*1..31]
#   end

# m, y = m + 12, y - 1 if m < 3

# week_day = (y + y / 4 - y / 100 + y / 400 + (13 * m + 8) / 5 + 1) % 7

# week_day.times { cal.unshift ' ' }

# cal.push ' ' until cal.length == 42

# cal.each_slice(7) { |line| puts '%2s %2s %2s %2s %2s %2s %2s' % line }

# ===========================================

# ◆【範囲】【配列】連番の配列を用意する
# これだと失敗
# ```
# [1..10] # => [1..10]
# ```

# ```
# こうすると連番のArrayを用意できる。
# [*1..10]
# # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# [*'a'..'f']
# # => ["a", "b", "c", "d", "e", "f"]
# ```


# # 【付随】◆配列であるグローバル変数を使用する時　「*変数名 」
# ```
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
# ```

# ---
# ◆3. 出力フォーマット用の%