class Search < ActiveRecord::Base
  attr_accessible :category, :location, :max_price

  def get_url()
  return "http://sfbay.craigslist.org/search/" + self.category + "/" + self.location + "?zoomToPosting=&altView=&query=&srchType=A&minAsk=&maxAsk=" + self.max_price.to_s

  end
end
