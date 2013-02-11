class CreateUserCriteria < ActiveRecord::Migration
  def change
    create_table :user_criteria do |t|
      t.string :user_id
      t.string :criteria_id

      t.timestamps
    end
  end
end
