module Mutations
  class GenerateOtp < GraphQL::Schema::RelayClassicMutation


    field :result, String, null: true
    argument :mobile, String, required: true

    def resolve(mobile:)
      user = User.find_for_database_authentication(mobile: mobile)
      if user.nil?
        user = User.create! mobile: mobile
      end

      result = Service.generate_otp(mobile)
      if result
        {
          result: 'Success'
        }
      else
        {
          result: 'Failure'
        }
      end
    end
  end
end
