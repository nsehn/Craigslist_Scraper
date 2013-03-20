class Bookmarklet < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :url
  attr_accessible :page_title
  attr_accessible :sms
  attr_accessible :email
  has_many :users, :through => :user_criterias

 
end