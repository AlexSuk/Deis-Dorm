class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :email
      t.text :bio
      t.text :icon

      t.timestamps null: false
    end
  end
end
