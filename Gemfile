source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.6'
gem 'rails-api'

gem 'pg'

gem 'figaro'

gem 'swagger-docs'

gem 'omniauth'
gem 'devise_token_auth'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
end
group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end
group :test do
  gem 'database_cleaner'
  gem 'guard-rspec', require: false
end
group :production do
  gem 'rails_12factor'
end