gem "interactor"
gem "rubocop"
gem "rubocop-rails"
gem "seedbank"
gem "tailwindcss-ruby"
gem "tailwindcss-rails", "~> 3.3.1"
gem 'inline_svg'

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rubocop-rspec", require: false
  gem "rubocop-rspec_rails", require: false
  gem "shoulda-matchers"
end
