class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates_uniqueness_of :space_id, scope: :user_id
end
