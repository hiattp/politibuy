source 'https://rubygems.org'

ruby '1.9.2'

gem 'rails', '3.2.8'

gem 'heroku'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'devise'

gem "paperclip", "~> 3.0"
gem 'aws-sdk'

# gem for mailchimp
gem "hominid"

# permissions
gem "rolify"
gem "cancan"

# error notification
gem 'exception_notification', :require => 'exception_notifier'

# payment
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end


gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
