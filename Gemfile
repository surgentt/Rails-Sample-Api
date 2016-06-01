source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.6'
gem 'rails-api'

gem 'pg'

gem 'devise'
gem 'figaro'

gem 'swagger-docs'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
end
group :development, :test do
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-rescue'
end
group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'guard-rspec', require: false
end