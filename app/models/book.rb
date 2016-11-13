class Book < ApplicationRecord
  belongs_to :user
  validates :title, :content, :price, presence:true
  validates :price, numerically: true
end
