module Mutations
  class SignIn < GraphQL::Schema::RelayClassicMutation
    field :access_token, String, null: true
    field :errors, [String], null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      @user = User.find_for_database_authentication(email: email)
      if @user.nil?
        {
          access_token: nil,
          errors: ['User does not exists!']
        }
      else

        access_token = if @user.valid_password?(password)
                         @user.access_token
                       end
        {
          access_token: access_token,
          errors: []
        }
      end

    end
  end
end
