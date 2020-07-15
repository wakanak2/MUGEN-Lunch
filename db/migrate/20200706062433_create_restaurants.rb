class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :branch
      t.string :name_kana, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :tel
      t.time :weekday_start
      t.time :weekday_finish
      t.time :weekend_start
      t.time :weekend_finish
      t.string :holiday
      t.integer :seat
      t.text :homepage
      t.boolean :standing, default: false, null: false
      t.string :smoking, default: 0, null: false
      t.boolean :closed, default: false, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
