class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :subtotal
      t.float :tax
      t.float :grand_total

      t.timestamps
    end
  end
end
