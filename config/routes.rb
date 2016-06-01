Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :users

  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

end
