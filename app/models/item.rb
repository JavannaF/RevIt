class Item < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
end
