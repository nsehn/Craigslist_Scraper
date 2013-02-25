class Search < ActiveRecord::Base #class Search is an object (a class object). It is inheriting the methods and properties of an ActiveRecord base class.
  attr_accessible :url, :user_searches

  has_many :user_searches
  has_many :users, :through => :user_searches

  accepts_nested_attributes_for :user_searches


  def get_url()
  "http://sfbay.craigslist.org/search/" + self.category + "/" + self.location + "?zoomToPosting=&altView=&query=&srchType=A&minAsk=&maxAsk=" + self.max_price.to_s

  end
end
