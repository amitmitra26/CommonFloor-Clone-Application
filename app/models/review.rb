class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validates :rating, presence: true, numericality: { only_integer: true }
  validates :comment, presence: true, length: { maximum: 500 }
  validates :property_id, uniqueness: { scope: :user_id, message: ":You have already Reviewed this Property" }
end
