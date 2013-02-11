require File.expand_path('../../config/environment', __FILE__)


url = "http://sfbay.craigslist.org/bia/"
scraper = CraigslistScraperScript.new(url)

scraper.get_data

