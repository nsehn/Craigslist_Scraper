class Search < ActiveRecord::Base #class Search is an object (a class object). It is inheriting the methods and properties of an ActiveRecord base class.
  attr_accessible :url, :user_searches

  has_many :user_searches
  has_many :users, :through => :user_searches
  # has_many :craigslist_items, :through => search_items

  accepts_nested_attributes_for :user_searches


end
