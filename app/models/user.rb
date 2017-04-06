class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :tutorials
  has_many :reviews
<<<<<<< HEAD
##
  has_many :favorite_tutorials
  has_many :favorites, through: :favorite_tutorials, source: :tutorial
##  
=======
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :avatar, presence: true
    

  
  ## add  :bucket => 'S3_BUCKET_NAME' to attached_file for development envioronment test
<<<<<<< HEAD
  has_attached_file :avatar, :bucket => 'S3_BUCKET_NAME', styles: { medium: "120x120>", thumb: "120x120>" }, default_url: "http://robohash.org/sitsequiquia.png?size=120x120"
=======
  has_attached_file :avatar, styles: { medium: "120x120>", thumb: "120x120>" }, default_url: "http://robohash.org/sitsequiquia.png?size=120x120"
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  
  
end