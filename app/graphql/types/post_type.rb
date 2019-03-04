module Types
  class PostType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: true
    field :body, String, null: true
    field :disabled, Boolean, null: true
    field :user, Types::UserType, null: true
    field :category, Types::CategoryType, null: true
    field :image, ApolloUploadServer::Upload, null: true
    field :video, ApolloUploadServer::Upload, null: true
  end
end
