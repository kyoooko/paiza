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
# 日曜が0~土曜日が6
days_of_the_week = days % 7


case m
when 4,6,9,1 then #30 
  # n = 1
  # calendar = []
  # 30.times do
  #   calendar << n+=1
  # end
  # 上記をcalendar = (10..30).map{|d| d}で書ける
  # 一桁の場合半角考慮なので下記
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

calendar.each_slice(7) {|d|
puts d.join(' ')
}