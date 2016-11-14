class Book < ApplicationRecord
  belongs_to :user
  validates :title, :content, :price, presence:true

  geocoded_by :city
  after_validation :geocode
end
