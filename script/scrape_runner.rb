require File.expand_path('../../config/environment.rb', __FILE__)

puts "#{File.expand_path('../../config/environment.rb', __FILE__)}"

url = "http://sfbay.craigslist.org/bia/"
scraper = CraigslistScraperScript.new(url)

scraper.get_data

