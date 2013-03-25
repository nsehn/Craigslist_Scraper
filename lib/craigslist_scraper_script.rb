require 'nokogiri' #scraping/parsing library
require 'open-uri' #part of library that allows user to download webpage

class CraigslistScraperScript

	def initialize(url)
		@data = Nokogiri::HTML(open(url))
	end

	def get_data
		rows = @data.css('.row')
		items = []
		rows.each do |row|
			category = row.at_css('.gc').try(:text)
			title = row.at_css('.pl').at_css('a').try(:text)
			itempnr = row.at_css('.itempnr')
			price = itempnr.at_css('.itempp').text.delete(" $").to_i
			location = itempnr.at_css('font').try(:text)
			link = row.at_css('.pl').at_css('a')['href']
			item = {:category => category, :title => title, :price => price, :location => location, :url => link}
			items.push(item)
		end
		return items #we are pushing this hash into an array and returning so that the get_data method when called in the searches controller has the data and then can use it
	end

end
