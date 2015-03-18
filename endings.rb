require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'date'

$PAGE = "current_month.html"

class Extractor

  def page(page=nil)
    @page ||= Nokogiri::HTML(open(page))
  end

  def timetable
    @page.css("table#Table1 tr")
  end

  def current_date_node
    timetable[Date.today.day]
  end

  def next_date_node
    timetable[Date.today.day + 1]
  end

  def current_day_maghrib
    time = current_date_node.children[7].children.first.text
    Time.parse("#{Date.today.year}-#{Date.today.month}-#{Date.today.day} #{time}")
  end

  def next_day_fajr
    time = next_date_node.children[2].children.first.text
    Time.parse("#{Date.today.year}-#{Date.today.month}-#{Date.today.day + 1} #{time}")
  end

  def maghrib_qaza_time
    next_day_fajr - ((next_day_fajr - current_day_maghrib)/2)
  end
end

