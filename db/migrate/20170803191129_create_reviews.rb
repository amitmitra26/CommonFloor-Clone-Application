class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.string :approved_by
      t.string :status, default: "Pending"
      t.references :property, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
