class Item < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validate  :picture_size
  
  



def self.search(search_name, search_rating) 
  return scope unless search_name.present? || search_rating.present?
  where(['name LIKE ? AND avg_rating LIKE ?', "%#{search_name}%", "%#{search_rating}%"])
end



  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end


end
