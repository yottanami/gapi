class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than: 5.megabytes }

  mount_uploader :video, VideoUploader
  validates :video, file_size: { less_than: 20.megabytes }

  def set_success(format, opts)

  end
end
