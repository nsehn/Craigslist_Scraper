class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :category
      t.integer :max_price
      t.string :location

      t.timestamps
    end
  end
end
