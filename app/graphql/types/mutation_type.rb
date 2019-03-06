module Types
  class MutationType < Types::BaseObject
    field :createCategory, mutation: Mutations::CreateCategory
    field :createPost, mutation: Mutations::CreatePost
    field :signIn, mutation: Mutations::SignIn
  end
end
