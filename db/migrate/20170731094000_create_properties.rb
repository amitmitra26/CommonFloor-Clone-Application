class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location
      t.integer :price
      t.integer :area
      t.string :owner
      t.integer :contact
      t.string :info

      t.timestamps
    end
  end
end
