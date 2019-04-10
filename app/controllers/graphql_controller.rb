class GraphqlController < ApplicationController
#  before_action :authenticate_user_from_token!

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    result = GapiSchema.execute(
      query_string,
      variables: query_variables,
      context: {current_user: current_user}, # Add the current_user into the query context
    )
    render json: result
  end

  def execute

    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]



    unless (query =~ /confirmOtp/) || (query =~ /requestOtp/)
      authenticate_user_from_token!
    end




    context = {
      # Query context goes here, for example:
      # current_user: current_user || User.last,
    }
    result = GapiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end

  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']
    return authentication_error unless auth_token
    authenticate_with_auth_token auth_token
  end

  def authenticate_with_auth_token(auth_token)
    # return if the token does not have the right format
    return authentication_error unless auth_token.include?(':')

    # Find the user by splitting the token and finding by id
    # Again, not the most secure way to do it, but works as an example.
    user_id = auth_token.split(':').first
    user = User.where(id: user_id).first

    # Use secure_compare to mitigate timing atttacks
    if user && Devise.secure_compare(user.access_token, auth_token)
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
        render json: { errors: 'Authentication Error' }
  end

end
