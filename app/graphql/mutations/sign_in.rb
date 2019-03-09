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
        if @user.valid_password?(password)
          access_token = @user.access_token
          {
            access_token: access_token,
            errors: []
          }
        else
          {
            access_token: nil,
            errors: ['Username and password is wrong!']
          }
        end
      end

    end
  end
end
