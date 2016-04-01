class CreateQuads < ActiveRecord::Migration
  def change
    create_table :quads do |t|
      t.string :name
      t.string :years #freshman/sophomore/junior/senior --> 0001 is only seniors
      t.float :rating
      t.text :info

      t.timestamps null: false
    end
  end
end
