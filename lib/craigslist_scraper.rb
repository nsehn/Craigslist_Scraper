require 'nokogiri' #scraping/parsing library
require 'open-uri' #part of library that allows user to download webpage

url = "http://sfbay.craigslist.org/bia/"
data = Nokogiri::HTML(open(url))
rows = data.css('.row')

rows.each do |row|
	category = row.at_css('.itemcg').text
	title = row.at_css('a').text
	price = row.at_css('.itempp').text.delete(" $").to_i
	location = row.at_css('.itempn').text
	link = row.at_css('a')['href']
end
