class Contact < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 100}
  validates :description, presence: true
  validates :author , presence: true
end
