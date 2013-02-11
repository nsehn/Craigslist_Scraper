class CraigslistItem < ActiveRecord::Base
  attr_accessible :category, :location, :price, :title, :url
  belongs_to :user_criterias
end
