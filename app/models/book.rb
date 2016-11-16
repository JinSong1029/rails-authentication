class Book < ApplicationRecord
  belongs_to :user
  validates :title, :content, :price, presence:true
  validates :price, numericality: {only_float: true}

  # code for geocode
  geocoded_by :city
  after_validation :geocode

  # code for paper clip
  has_attached_file :avatar, styles: { medium: "300*300>", thumb: "100*100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
end
