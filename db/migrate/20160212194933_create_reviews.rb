class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.float :rating
      t.integer :user_id
      t.integer :building_id
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
