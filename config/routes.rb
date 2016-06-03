Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, only: [:create, :show, :index] do
        resources :orders, only: [:create, :show, :index]
      end
      resources :menu_items, except: [:new, :edit]
    end
  end

end