module Types
  class PostType < Types::BaseObject
    field :title, String, null: true
    field :body, String, null: true
    field :disabled, Boolean, null: true
    field :user, Types::UserType, null: true
    field :category, Types::CategoryType, null: true
    field :image, String, null: true
    field :video, String, null: true
  end
end