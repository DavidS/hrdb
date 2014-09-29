source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# install this group when developing hrdb
# This will not be installed on travis
group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # run guard to get live feedback on your changes
  gem 'guard-rspec'
  # required for guard
  gem 'rb-readline'
end

# install this group when running the tests
group :test do
  # required for travis
  gem 'rake'
  gem "codeclimate-test-reporter"
end

# add gems that are both used for development and test
group :test, :development do
  # Proper testing syntax
  gem 'rspec-rails'

  # check for style issues
  gem 'rubocop'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# authentication, require rails 4.1 compatible version
gem 'sorcery', '>= 0.8.6'

# search syntax and autocompletion for search boxes
gem "scoped_search"

# required on windows
gem "tzinfo-data"

# Styling with style
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails", '~> 3.2.0'
