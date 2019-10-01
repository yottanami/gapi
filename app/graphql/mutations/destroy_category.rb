module Mutations
  class DestroyCategory < GraphQL::Schema::RelayClassicMutation
    argument :id, Integer, required: true

    type Types::CategoryType

    def resolve(id:)
      Category.find(id).destroy
    end
  end
end
