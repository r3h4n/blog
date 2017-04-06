class FavoriteTutorial < ApplicationRecord
  belongs_to :tutorial
  belongs_to :user
end
