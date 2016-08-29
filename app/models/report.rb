class Report < ActiveRecord::Base
  belongs_to :reporter, class_name: 'User', dependent: :destroy
  belongs_to :reported, class_name: 'Review', dependent: :destroy
  validates :review_id,presence:true
  validates :user_id,presence:true
end
