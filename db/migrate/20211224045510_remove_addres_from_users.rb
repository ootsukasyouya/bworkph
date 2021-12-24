class RemoveAddresFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :addres, :string
    remove_column :users, :phone_number, :string
    remove_column :users, :age, :integer
  end
end
