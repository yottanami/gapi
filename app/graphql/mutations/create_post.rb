module Mutations
  class CreatePost < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :body, String, required: false
    argument :category_id, ID, required: true
    argument :image, String, required: false
    argument :video, String, required: false

    def resolve(title:, body:, image:, video:, category_id:)
      category = Category.find(category_id)
      if !category.nil?
        post = Post.new(title: title, body: body, category: category, image: image, video: video, user: context[:current_user])
        if post.save
          {
            post: post,
            errors: [],
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end

      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end


#mutation example($post: CreatePostInput!){
#  createPost(input: $post) {#
#		post{
#      title
#      body
#    }
#  }
#}
