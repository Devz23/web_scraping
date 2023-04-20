require "rubygems"
require "nokogiri"
require "open-uri"

def scrap_mail
  begin
page = Nokogiri::HTML (URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

city_number = page.xpath('//a[contains(@href, "95")]/@href').map(&:text)

city_number_link = city_number.each{|i|i[0] = ""}.map{|link| "http://www.annuaire-des-mairies.com" + link}
#puts city_number_link

list_emails = []

for i in 0..(city_number_link.length - 1)
  page_mail = Nokogiri::HTML (URI.open(city_number_link[i]))
  list_emails += page_mail.xpath('//tr/td[contains(text(), "@")]').map(&:text)
end

puts list_emails

end
scrap_mail