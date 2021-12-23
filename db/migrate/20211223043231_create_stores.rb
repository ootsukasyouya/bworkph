class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, :null => false
      t.string :addres, :null => false
      t.string :phone_number, :null => false
      t.text :profile, :null => false
      t.string :station_name, :null => false
      t.integer "how_to_work", default: 0, null: false
      t.integer "how_to_earn", default: 0, null: false
      t.integer "treatment", default: 0, null: false
      t.integer "go_to_work", default: 0, null: false
      t.integer "skill", default: 0, null: false
      t.integer "salary", default: 0, null: false
      t.integer "time_zone", default: 0, null: false
      t.integer "atmosphere", default: 0, null: false
      t.integer "age_group", default: 0, null: false
      t.integer "prefecture_name", default: 0, null: false
      t.integer "station_on_foot", default: 0, null: false
      t.timestamps
    end
  end
end
