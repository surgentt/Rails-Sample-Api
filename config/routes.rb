Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {registrations: 'api/v1/users/registrations', sessions: 'api/v1/users/sessions'}
      resources :users, only: [:create, :show, :index] do
        resources :orders, only: [:create, :show, :index]
      end
      resources :menu_items, except: [:new, :edit]
      get '/orders', to: 'orders#view_all', as: 'orders'
      resources :orders, only: [:update]
    end
  end

end