module Types
  class MutationType < Types::BaseObject
    field :createCategory, mutation: Mutations::CreateCategory
    field :createPost, mutation: Mutations::CreatePost
  end
end
