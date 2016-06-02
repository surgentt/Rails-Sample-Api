Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show, :index]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  # Points to the git submodule in the public directory
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

end