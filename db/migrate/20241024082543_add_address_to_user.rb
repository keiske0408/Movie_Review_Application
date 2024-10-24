class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_reference :users, :address_region
    add_reference :users, :address_province
  end
end
