source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'kaminari', '~> 0.17.0'
gem 'bootstrap4-kaminari-views'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'rails-i18n', '~> 5.1' 
gem 'bcrypt', '3.1.11'

group :development, :test do
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'spring-commands-rspec'
  gem 'faker'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'webdrivers'
  gem 'capybara', '>= 2.15'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
