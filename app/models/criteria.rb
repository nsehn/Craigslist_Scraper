class Criteria < ActiveRecord::Base
  attr_accessible :url
  has_many :users, :through => :user_criterias
end
