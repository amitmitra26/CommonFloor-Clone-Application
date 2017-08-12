class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location
      t.string :price
      t.string :area
      t.string :owner
      t.string :contact
      t.string :info
      t.string :owner_type
      t.timestamps
    end
  end
end
