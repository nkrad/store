class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :designer
      t.string :size
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
