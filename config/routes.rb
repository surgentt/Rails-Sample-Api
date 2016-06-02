Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, only: [:create, :show, :index]
      resources :menu_items, except: [:new, :edit]
    end
  end

  # Points to the git sub module in the public directory
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

end