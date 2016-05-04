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
      t.integer :pref_ac
      t.integer :pref_social
      t.integer :housing_number
      t.string :pref_year
      t.string :pref_gender
      t.string :pref_bedtime
      t.string :pref_room_type

      t.integer :choice_one
      t.integer :choice_two
      t.integer :choice_three
      t.integer :choice_four
      t.integer :choice_five

      t.timestamps null: false
    end
  end
end
