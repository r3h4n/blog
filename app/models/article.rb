class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
    mount_uploader :avatar, AvatarUploader
    
  
def self.search(search)
  where("title LIKE ?", "%#{search}%")
  where("text LIKE ?", "%#{search}%")
end
    
end

