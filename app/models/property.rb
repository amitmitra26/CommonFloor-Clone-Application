class Property < ApplicationRecord
  validate :property_owner_type
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { in: 5..255 }
  validates :description, presence: true, length: { in: 5..1024 }
  validates :owner, presence: true, length: { in: 3..100 }
  validates :contact, presence: true, length: { is: 10 }
  validates :location, presence: true, length: { in: 3..50 }
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
    validate  :picture_size
  def property_owner_type
    if owner_type == 'I have a Property'
      unless price.present?
        errors.add(:price, "Cant be blank")
      end
      unless area.present?
        errors.add(:area, "Cant be blank")
      end
    end
  end
private
  # Validates the size of an uploaded picture.
 def picture_size
   if picture.size > 5.megabytes
     errors.add(:picture, "should be less than 5MB")
   end
 end

end
