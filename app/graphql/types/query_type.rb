# -*- coding: utf-8 -*-
module Types
  class QueryType < Types::BaseObject

    field :currentUser, UserType, null: false do
      description "Returns the current user"
      #resolve -> (obj, args, ctx) {
      #  ctx[:current_user]
      #}

    end

    def currentUser()
      current_user
    end

    field :post, PostType, null: true do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :posts, [PostType], null: true do
      description "List of all posts"
      argument :category_id, ID, required: true
    end

    def posts(category_id:)
      Post.where(category_id: category_id)
    end

    field :categories, [CategoryType], null: true do
      description "List of all categories or categories of a directory"
#      argument :parent_id, ID, required: false
    end

    def categories(parent_id: nil)
      parent_id.nil? ?  Category.all : Category.where(parent_id: parent_id)
    end

  end
end
