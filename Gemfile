source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '7.0.7.2'

gem 'rack-cors'

gem 'pg'

gem 'aasm'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'jwt'

gem 'sidekiq'

gem 'whenever', require: false

# Send emails
gem 'sendgrid-ruby'

gem 'sentry-rails'
gem 'sentry-ruby'

group :development, :test do
  gem 'annotate'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'dotenv', '~> 2.7', '>= 2.7.6'
  gem 'letter_opener'
  gem 'rubocop', require: false
end
