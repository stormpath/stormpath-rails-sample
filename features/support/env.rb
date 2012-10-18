require 'cucumber/rails'

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  Stormpath::Rails::Client.all_accounts.each do |account|
    Stormpath::Rails::Client.ds.delete account
  end
end

Cucumber::Rails::Database.javascript_strategy = :truncation

FactoryGirl.definition_file_paths = %w(features/factories)
