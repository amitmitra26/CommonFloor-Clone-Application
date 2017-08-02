class AddRoomToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :bedrooms, :string
    add_column :properties, :bathrooms, :string
  end
end
