require_relative "extractor"

$PAGE = "current_month.html"

e = Extractor.new($PAGE)
e.parse_times!

puts "Maghrib is qadha at #{e.maghrib_qadha_time}."
