class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.string :url

      t.timestamps
    end
  end
end
