class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :criterias, :through => :user_criterias
end
