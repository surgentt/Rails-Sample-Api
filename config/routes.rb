Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  # Points to the git submodule in the public directory
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

end
