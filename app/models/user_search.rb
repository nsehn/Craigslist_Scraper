class UserSearch < ActiveRecord::Base
  attr_accessible :search_id, :user_id, :title

  belongs_to :user
  belongs_to :search
end
