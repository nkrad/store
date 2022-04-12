class RemoveAddressIndex < ActiveRecord::Migration[7.0]
  def change
    remove_column :addresses, :province_id
  end
end
