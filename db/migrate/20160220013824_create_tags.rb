class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.integer :foreign_table
      t.string :foreign_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
