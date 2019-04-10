module Types
  class MutationType < Types::BaseObject
    field :createCategory, mutation: Mutations::CreateCategory
    field :createPost, mutation: Mutations::CreatePost
    field :generateOtp, mutation: Mutations::GenerateOtp
    field :confirmOtp, mutation: Mutations::ConfirmOtp
  end
end
