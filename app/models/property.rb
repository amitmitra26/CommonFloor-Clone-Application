class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 5..255 }
  validates :description, presence: true, length: { in: 5..1024 }
  validates :price, presence: true
  validates :area, presence: true
 validates :owner, presence: true, length: { in: 3..100 }
 validates :contact, presence: true, length: { is: 10 }
  validates :location, presence: true, length: { in: 3..50 }

end
