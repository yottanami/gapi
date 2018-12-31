module Types
  class CategoryType < Types::BaseObject
    field :title, String, null: true
    field :body, String, null: true
    field :disabled, Boolean, null: true
    field :user, Types::UserType, null: true
    field :parent_id, ID, null: true
    field :image, ApolloUploadServer::Upload, null: true
  end
end
