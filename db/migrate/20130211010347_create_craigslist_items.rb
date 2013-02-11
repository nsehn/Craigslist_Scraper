class CreateCraigslistItems < ActiveRecord::Migration
  def change
    create_table :craigslist_items do |t|
      t.string :category
      t.string :title
      t.integer :price
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
