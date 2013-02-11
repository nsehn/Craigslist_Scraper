class UserCriteria < ActiveRecord::Base
  attr_accessible :criteria_id, :user_id
  has_many :users, :criterias
end
