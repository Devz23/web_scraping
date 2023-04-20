require "rubygems"
require "nokogiri"
require "open-uri"

def hash 
page = Nokogiri::HTML (URI.open("https://coinmarketcap.com/all/views/all/"))
currencies_symbol = page.xpath('//td[contains(@class, "by__symbol")]').map(&:text)
#symbol = page.text
puts currencies_symbol
#crypto = Hash[names.zip(prices.map(&:to_f))]

currencies_value = page.xpath('//td[contains(@class, "by__price")]').map(&:text)
puts currencies_value

Hash_symbol_value = Hash[currencies_symbol.zip(currencies_value)]

Hash_symbol_value.each {|k,v| puts "#{k} : #{v}" }

end
hash