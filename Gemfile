source "https://rubygems.org"

ruby "3.4.2"

gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.2"
gem "stimulus-rails"
gem "turbo-rails"


gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cable"
gem "solid_cache"
gem "solid_queue"

gem "bootsnap", require: false

gem "kamal", require: false

gem "thruster", require: false

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

eval_gemfile "Gemfile.app"
