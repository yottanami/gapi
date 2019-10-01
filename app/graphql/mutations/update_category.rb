module Mutations
  class UpdateCategory < GraphQL::Schema::RelayClassicMutation

    # TODO: define return fields
    field :category, Types::CategoryType, null: false
    field :errors, [String], null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :body, String, required: false
    argument :image, ApolloUploadServer::Upload, required: false

    type Types::CategoryType

    def resolve(id:, **attributes)
      Category.find(id).tap do |category|
        if category.update(attributes)
          {
            category: category,
            errors: []
          }
        else
          {
            category: nil,
            errors: category.errors.full_messages
          }
        end
      end
    end
  end
end
