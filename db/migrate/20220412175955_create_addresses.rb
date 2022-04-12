class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :fname
      t.string :lname
      t.string :street
      t.string :city
      t.string :postalcode
      t.integer :province_id

      t.timestamps
    end
  end
end
