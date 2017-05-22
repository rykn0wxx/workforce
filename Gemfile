source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '= 5.0.2'
gem 'sqlite3'
gem 'puma', '~> 3.8', '>= 3.8.2'
gem 'rack-cors'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'bourbon', '~> 4.2', '>= 4.2.6'
gem 'neat', '~> 2.0'

gem 'angularjs-rails', '= 1.5.8'
gem 'angular-ui-router-rails', '~> 0.2.15'
gem 'rails-angular-material', '~> 1.0', '>= 1.0.5'
gem 'angular-rails-templates'
gem 'jquery-rails', '~> 4.2', '>= 4.2.2'
gem 'rails-ujs', '~> 0.1.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'consistency_fail'
  gem 'spring'
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jsonapi-resources'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'activeadmin', github: 'activeadmin'
gem 'arbre', '~> 1.1', '>= 1.1.1'
gem 'wdm', '~> 0.1.1'
gem 'active_admin_flat_skin', '~> 0.1.2'
gem 'roo', '~> 2.7', '>= 2.7.1'
gem 'active_admin_import', '~> 3.0'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'roadie', '~> 3.1.0'
