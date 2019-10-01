module Mutations
  class UpdatePost < GraphQL::Schema::RelayClassicMutation

    # TODO: define return fields
    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :body, String, required: false
    argument :category_id, ID, required: true
    argument :image, ApolloUploadServer::Upload, required: false
    argument :video, ApolloUploadServer::Upload, required: false

    type Types::PostType

    def resolve(id:, **attributes)
      Post.find(id).tap do |post|
        if post.update(attributes)
          {
            post: post,
            errors: []
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
