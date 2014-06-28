# This file is generated when you run 'rails generate rspec:install', don't attempt to generate it yourself, no need to, it's more important to understand what it does.

# Run Rails in test environment. pop quiz: why?
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  # start by reading about transactions: https://relishapp.com/rspec/rspec-rails/docs/transactions
  # why/when do we turn it off? it's mainly due to capybara: https://github.com/jnicklas/capybara#transactions-and-database-setup
  # Transactions work fine with unit tests but not with capybara.
  config.use_transactional_fixtures = false

  # Since we turned the transactional_fixtures off, we have to find a way to clean the test database after each run, otherwise our test database will be ever growing and will give us unpredictable results.
  config.before(:suite) do
      # database cleaner offers us multiple strategies, including :transaction. The nice thing about using transactions, they are fast, but like I mentioned above, they won't work with capybara and selenium. So here we tell database cleaner to use truncation: basically truncate the database after each run. This will make our tests run slower and there are clever ways to conditionally switch between strategies depending on the type of test. For exmaple: use transaction strategy except with capybara, use truncation. We won't bother wourselves with that for now, we will use truncation for everything. Take a minute and read about conditionally switching strategies: http://weilu.github.io/blog/2012/11/10/conditionally-switching-off-transactional-fixtures/
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
