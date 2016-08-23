class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :item
  belongs_to :user
  geocoded_by :store_location
  after_validation :geocode, :if => :store_location_changed?
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :comment, presence: true, length: {maximum: 200}
  validates :price, presence: true
  validates :rating, presence: true
  validates :store, presence: true
  validates :item_id, presence: true
end
