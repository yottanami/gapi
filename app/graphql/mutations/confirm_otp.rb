module Mutations
  class SignIn < GraphQL::Schema::RelayClassicMutation
    require 'lib/service'

    field :access_token, String, null: true
    field :errors, [String], null: false

    argument :mobile, String, required: true
    argument :otp, String, required: true

    def resolve(mobile:, otp:)
      user = User.find_for_database_authentication(mobile: mobile)
      if user.nil?
        {
          access_token: nil,
          errors: ['User does not exists!']
        }
      else
        user.external_otp = otp
        result = Service.confirm_otp

        if result
          user.external_token = result
          access_token = user.access_token
          {
            access_token: access_token,
            errors: []
          }
        else
          {
            access_token: nil,
            errors: ['Wrong otp!']
          }
        end
      end

    end
  end
end
