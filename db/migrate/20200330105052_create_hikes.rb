class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :location
      t.integer :milage
      t.string :join_by
      t.integer :user_id
    end
  end
end
