gem "interactor"
gem "rubocop"
gem "rubocop-rails"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "rubocop-rspec", require: false
  gem "rubocop-rspec_rails", require: false
  gem "shoulda-matchers"
end
