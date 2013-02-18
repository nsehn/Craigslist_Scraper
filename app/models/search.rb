class Search < ActiveRecord::Base #class Search is an object (a class object). It is inheriting the methods and properties of an ActiveRecord base class.
  attr_accessible :category, :location, :max_price 
  has_many :users, :through => :user_criterias

  def get_url()
  "http://sfbay.craigslist.org/search/" + self.category + "/" + self.location + "?zoomToPosting=&altView=&query=&srchType=A&minAsk=&maxAsk=" + self.max_price.to_s

  end
end
