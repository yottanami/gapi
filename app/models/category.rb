class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", foreign_key: 'parent_id', required: false, optional: true
  belongs_to :user
end
