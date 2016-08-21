class Evaluation < ActiveRecord::Base
  belongs_to :evaluater, class_name: 'User', dependent: :destroy
  belongs_to :evaluated, class_name: 'Owner', dependent: :destroy
end
