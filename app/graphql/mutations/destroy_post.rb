module Mutations
  class DestroyPost < GraphQL::Schema::RelayClassicMutation
    argument :id, Integer, required: true

    type Types::PostType

    def resolve(id:)
      Post.find(id).destroy
    end
  end
end
