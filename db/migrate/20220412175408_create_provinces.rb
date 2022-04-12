class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :province
      t.belongs_to :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
