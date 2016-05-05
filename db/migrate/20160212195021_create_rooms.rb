class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :years_available
      t.string :room_type
      t.string :gender
      t.decimal :price, :precision =>6, :scale =>2
      t.float :area
      t.string :dimensions
      t.integer :floor
      t.integer :rough_housing_num
      t.integer :building_id
      t.string :x_coordinate
      t.string :y_coordinate

      t.float :cleanliness, default: 3
      t.float :noisiness, default: 3
      t.float :light, default: 3
      t.float :social, default: 3
      t.float :location, default: 3
      t.float :issues, default: 3
      t.float :general_rating, default: 3

      t.boolean :kitchen, default: false
      t.boolean :laundry, default: false
      t.boolean :ac, default: false

      t.timestamps null: false
    end
  end
end
