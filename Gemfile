source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails'
gem 'bootsnap', '>= 1.4.4', require: false
gem "cpf_cnpj"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '0.3.9'
  gem 'rspec-rails', '5.0.1'
  gem 'shoulda-matchers', '~> 4.5.1', require: false
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'database_cleaner', '~> 2.0.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
