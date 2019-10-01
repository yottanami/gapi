module Types
  class MutationType < Types::BaseObject
    field :createCategory, mutation: Mutations::CreateCategory
    field :destroyCategory, mutation: Mutations::DestroyCategory
    field :updateCategory, mutation: Mutations::UpdateCategory
    field :createPost, mutation: Mutations::CreatePost
    field :destroyPost, mutation: Mutations::DestroyPost
    field :updatePost, mutation: Mutations::UpdatePost
    field :generateOtp, mutation: Mutations::GenerateOtp
    field :confirmOtp, mutation: Mutations::ConfirmOtp
  end
end
