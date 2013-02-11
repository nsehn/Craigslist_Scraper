require File.expand_path('../../config/environment', __FILE__)

puts 'Test!'

url = "http://sfbay.craigslist.org/bia/"
scraper = CraigslistScraper.new(url)

scraper.get_data

