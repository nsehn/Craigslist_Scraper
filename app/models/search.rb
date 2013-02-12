class Search < ActiveRecord::Base
  attr_accessible :category, :location, :max_price

  def get_url
  return "http://sfbay.craigslist.org/search/" + :category + "/" + :location + "?zoomToPosting=&altView=&query=&srchType=A&minAsk=&maxAsk=" + :max_price

  end
end
