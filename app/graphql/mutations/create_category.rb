module Mutations
  class CreateCategory < GraphQL::Schema::RelayClassicMutation
    field :category, Types::CategoryType, null: false
    field :errors, [String], null: false

    argument :title, String, required: true
    argument :body, String, required: false
    argument :parent_id, ID, required: false
    argument :image, ApolloUploadServer::Upload, required: false

    def resolve(title:, body:, parent_id:)
      category = Category.new(title: title, body: body, parent_id: parent_id, user: context[:current_user])
      if category.save
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
