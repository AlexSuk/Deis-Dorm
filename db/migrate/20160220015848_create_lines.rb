class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.text :description
      t.integer :up_vote
      t.integer :user_id
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
