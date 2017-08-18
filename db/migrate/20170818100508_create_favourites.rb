class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.boolean :interested, default: false
      t.references :user
      t.references :property

      t.timestamps
    end
  end
end
