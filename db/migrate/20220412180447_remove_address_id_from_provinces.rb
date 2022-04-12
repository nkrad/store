class RemoveAddressIdFromProvinces < ActiveRecord::Migration[7.0]
  def change
    remove_column :provinces, :address_id
  end
end
