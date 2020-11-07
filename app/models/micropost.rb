class Micropost < ApplicationRecord
  belongs_to :user
  attr_accessor :picture_cache
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :img, PictureUploader
  validates :user_id, presence: true
  validates :picture, presence: true
  validates :content, length: { maximum: 140 }
  validate  :picture_size
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
