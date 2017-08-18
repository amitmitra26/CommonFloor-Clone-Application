class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :property_id, uniqueness: { scope: :user_id, message: ":You have already Added this Property in your Favourite List" }
end
