class Tutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  
  has_attached_file :tutorial_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :tutorial_img, content_type: /\Aimage\/.*\z/

end