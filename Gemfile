source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.6'

gem 'pg'

gem 'devise'
gem 'figaro'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'swagger-docs'
gem 'swagger-ui_rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'web-console', '~> 2.0'
  gem 'guard-rspec', require: false
end
group :development, :test do
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end