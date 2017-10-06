source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Rails and DB
ruby '2.2.5'
gem 'pg', '~> 0.18'
gem 'rails', '~> 5.0.6'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'cancancan', '~> 1.10'
gem 'carrierwave', '~> 1.1'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.3.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'puma', '~> 3.0'
gem 'rmagick', '~> 2.16.0'
gem 'rubocop', '~> 0.49.1', require: false
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.5'
gem 'slim-rails', '~> 3.1', '>= 3.1.2'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.1'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'better_errors', '~> 2.3'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'listen', '~> 3.0.5'
  gem 'pry', '~> 0.10.4'
  gem 'pry-rails', '~> 0.3.6'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
