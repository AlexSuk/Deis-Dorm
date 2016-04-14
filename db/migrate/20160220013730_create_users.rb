class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.string :email
      t.text :bio
      t.attachment :icon
      t.boolean :admin?

      t.integer :pref_price
      t.integer :pref_size
      t.integer :pref_clean
      t.integer :pref_noise
      t.integer :pref_location
      t.integer :housing_number
      t.string :pref_year
      t.string :pref_gender
      t.string :pref_bedtime
      t.string :pref_room_type

      t.timestamps null: false
    end
  end
end
