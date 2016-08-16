class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :comment, presence: true, length: {maximum: 200}
  validates :price, presence: true
  validates :rating, presence: true
  validates :store, presence: true
end
