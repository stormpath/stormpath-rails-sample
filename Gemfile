source :rubygems

gem "sqlite3", groups: [:test, :development]
gem "pg", group: :production

gem "thin"

gem "rails", "3.2.11"

gem "devise-stormpath", "0.2.2"

group :assets do
  gem "sass-rails"
  gem "bootstrap-sass"
  gem "uglifier"
end

gem "jquery-rails"
gem "slim-rails"
gem "simple_form"

group :test, :development do
  gem "rspec-rails"
  gem "cucumber-rails", require: false
  gem "capybara"
  gem "launchy"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "rb-inotify", "~> 0.8.8"
  gem "guard-rspec"
  gem "guard-cucumber"
end

group :test do
  gem "vcr"
  gem "webmock"
end
