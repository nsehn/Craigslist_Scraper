class DropCriteria < ActiveRecord::Migration
  def up
  	drop_table :criteria
  end

  def down
  	raise "Errr.. no. Stop it."
  end
end
