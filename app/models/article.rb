class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 100 }
  belongs_to :user
  validates :user_id, presence: true
  
def self.search(search)
  where("lower(title) LIKE lower(?)", "%#{search}%")   # SQL: lower=downcase
  where("lower(text) LIKE lower(?)", "%#{search}%")
end
    
end