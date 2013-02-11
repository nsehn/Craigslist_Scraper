class CraigslistItem < ActiveRecord::Base
  attr_accessible :category, :location, :price, :title, :url
end
