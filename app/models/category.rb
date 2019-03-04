class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", foreign_key: 'parent_id', required: false, optional: true
  belongs_to :user

  mount_uploader :image, CategoryImageUploader
  validates :image, file_size: { less_than: 5.megabytes }

end
