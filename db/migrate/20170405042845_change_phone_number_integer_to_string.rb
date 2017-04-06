class ChangePhoneNumberIntegerToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :phone_number
    add_column :restaurants, :phone_number, :string
  end
end
