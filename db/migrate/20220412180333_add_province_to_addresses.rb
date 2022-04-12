class AddProvinceToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :province_id, :integer
  end
end
