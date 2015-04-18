require_relative "extractor"

CURRENT_MONTH_PAGE = "current_month.html"

e = Extractor.new(CURRENT_MONTH_PAGE)
e.parse_times!

puts "Maghrib is qadha at #{e.maghrib_qadha_time}."
