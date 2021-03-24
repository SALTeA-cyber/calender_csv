# gemを用いて指定した期間の祝日をcsvファイルで出力するアプリを作成する
require "holiday_japan"
require "date"
require "csv"

# csvファイルに書き込む
CSV.open('/Users/promising/test/calender_csv.csv','w') do |calender_csv|
    calender_csv << ["年","月","日","曜日","祝日"]
end

# parseを用いて文字列として処理する場合
puts "8桁の数字を入力し、調べる期間を決定してください。\n例:20200830 (2020年8月30日)"
puts "調べ始める先頭の日付" ;date_head = gets.to_s
puts "調べ終わる末尾の日付" ;date_tail = gets.to_s

# 入力された数字を日付に変換
date1 = Date.parse(date_head)
date2 = Date.parse(date_tail)

youbi = ["日", "月", "火", "水", "木", "金", "土"]

while date1 <= date2 do
    date_array = [
        year = date1.year,
        month = date1.month,
        day = date1.day,
        wday = date1.wday
    ]
    holiday = HolidayJapan.name(date1)
    date_array_row = [year,month,day,youbi[wday],holiday]
    # csvファイルに書き込む
    CSV.open('/Users/promising/test/calender_csv.csv','a') do |calender_csv|
        calender_csv << date_array_row = [year,month,day,youbi[wday],holiday]
    end
    date1 = date1 + 1
end
