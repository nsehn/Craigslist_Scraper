class RenameUserCriteriaToUserSearches < ActiveRecord::Migration
  def up
  	rename_table :user_criteria, :user_searches
  	rename_column :user_searches, :criteria_id, :search_id

  	remove_column :searches, :category
  	remove_column :searches, :max_price
  	remove_column :searches, :location

  	add_column :searches, :url, :text
  	add_column :user_searches, :title, :string

  end

  def down
  	raise "Errr... Nisha... you need to dop the reverse of the Up method statement here"
 	rename_column :user_searches, :search_id, :criteria_id
  	rename_table :user_searches, :user_criteria
  end
end
