# ❓13日の金曜日(2桁) （解答コード付き)
# ========================================================================================================================
# 問題
# 西暦年と月を無作為に選んだときに、その年月の13日が金曜日になる確率を求めてください。

# ただし、各月の日数は以下のように決まることに注意してください。
# ・4, 6, 9, 11月は30日
# ・2月は閏年ならば29日、そうでなければ28日
# ・それ以外の月は31日

# ただし、閏年は次のような年のことをいいます。
# ・西暦が4で割り切れる年は閏年
# ・ただし、100で割り切れる年は平年
# ・ただし、400で割り切れる年は閏年

# ただし、1800年1月1日は水曜日です。(現実のカレンダーです)

# ========================================================================================================================
# <自分の答え(できず)>
# def uruudoshi?(y)
#   (y%400).zero? || (y%100).nonzero? && (y%4).zero?
# end

# puts case m
#      when 2
#       uruudoshi?(y) ? 29 : 28
#      when 4, 6, 9, 11
#        30
#      else
#        31
#      end


# ==================================================================================
# <解答＞
# 閏年は400年周期だから400年だけ考えれば良い
# 400年の月数=4800月(400/7は割り切れる)
fridays = 400 * 12

fridays_the_13th = 0
(1..400).each do |y|
  (1..12).each do |m|
    m, y = m + 12, y - 1 if m < 3

    week_num = (y + y / 4 - y / 100 + y / 400 + (13 * m + 8) / 5 + 13) % 7

    fridays_the_13th += 1 if week_num == 5
  end
end
puts fridays_the_13th
puts '%.2f' % (fridays_the_13th.to_f / fridays)
# puts (fridays_the_13th.to_f / fridays).round(2)
# =========================================================================-

# ◆13日の金曜日
# [13日が金曜日になる確率 - 計算用紙](https://haruya12.hatenadiary.org/entry/20120413/1334327520)

# [13日の金曜日は他の曜日より多い？ – 曜日の確率は違う | 数学の面白いこと・役に立つことをまとめたサイト](https://analytics-notty.tech/friday-the-13th-is-more-than-the-other-days/)

# [１３日の金曜日になる確率 - OKWAVE](https://okwave.jp/qa/q357456.html)

# [13日が金曜日である確率｜るじパルコ｜note](https://note.com/taraba_kanico/n/nb1db88b8c8da)

# [Ruby 13日の金曜日が毎年あることを証明しなさい - 島ぶくろ](http://saltheads.blog134.fc2.com/blog-entry-66.html?sp)

# Cf.
# [13日の金曜日を返すプログラム - Qiita](https://qiita.com/SnowLeopard_/items/77a62e2eabfb5410a7e5)


# # ◆小数点桁数指定 sprintf/%.2f
# [Rubyで小数点桁数指定 - Qiita](https://qiita.com/seteen/items/c8ac3a6349cd53ef25b7)
# * round
# ```
# 1.2345.round    #=> 1
# 1.2345.round(2) #=> 1.23
# 1.2345.round(3) #=> 1.235 (四捨五入)
# ```
# * sprintf
# ```
# sprintf( "フォーマット", 戻したい値 )
# ```
# [Rubyでsprintfを使う方法を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/30839)

# # ◆slice
# [【Ruby入門説明書】ruby sliceについて解説 | WEBCAMP NAVI](https://web-camp.io/magazine/archives/16198#Stringslice)

# * []メソッドのエイリアス（別名）です。
# ただし、ただの別名ではなく、より柔軟に使えるようになっています。なにより、Arrayクラス（配列）だけではなく、Stringクラス（文字列）やHashクラス（ハッシュ）でも定義されています

# * 配列.slice
# ```
# arr = [10,20,30,40,50]
# p(arr[4])
# p(arr.slice(4))
# ```
# [Array#slice (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/slice.html)

# * 文字列.slice
# ```
# str = "I love Ruby"
# p(str[2, 4])
# p(str.slice(2, 4))
# ```

# # ◆slice!
# [Array#slice! (Ruby 2.7.0 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/slice=21.html)
# = sliceのものを取り除いたもの

# # ◆wdayメソッド
# = 曜日を求める
# [Rubyで曜日を求める方法を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://techacademy.jp/magazine/21762)


# ◆複数の変数に代入
# ```
# m, y = m + 12, y - 1 if m < 3
# ```





