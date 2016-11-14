class Book < ApplicationRecord
  belongs_to :user
  validates :title, :content, :price, presence:true
  validates :price, numericality: {only_float: true}

  geocoded_by :city
  after_validation :geocode
end
