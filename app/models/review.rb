class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  validates :user_id, presence: true
end
