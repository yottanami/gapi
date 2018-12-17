Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

    # Workaround for --API mode
    # rawgit is used to work around github's use of text/plain MIME types'

    get "/javascripts/graphiql/rails/application.js", to: redirect('/javascripts/graphiql.js')
    get "/stylesheets/graphiql/rails/application.css", to: redirect('/stylesheets/graphiql.css')
  end
end
