Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  match '/users', to: 'users#index', via: 'get'
  match '/properties/:id', to: 'properties#show', via: 'get'

  # scope module: :api do
  #   scope module: :v1 do
  #     resources :users
  #   end
  # end

  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

end
