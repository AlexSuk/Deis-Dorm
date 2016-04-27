class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :description
      t.string :is_kind
      t.integer :quad_id
      t.string :years #freshman/sophomore/junior/senior --> 0001 is only seniors

      t.timestamps null: false
    end
  end
end
