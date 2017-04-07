class Tutorial < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :favorite_tutorials
  has_many :favorited_by, through: :favorite_tutorials, source: :user 
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 300 }
  validates :author, presence: true
  validates :tutorial_img, presence: true
  validates :category_id, presence: true
  
## add  :bucket => 'S3_BUCKET_NAME' to attached_file for development envioronment test
  has_attached_file :tutorial_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :tutorial_img, content_type: /\Aimage\/.*\z/

end