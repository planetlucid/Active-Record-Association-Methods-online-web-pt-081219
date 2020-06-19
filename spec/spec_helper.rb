ENV["PLAYLISTER_ENV"] = "test"

require_relative '../config/environment'

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.order = 'default'

  `rake db:migrate`

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# def reset_database
#   `rake db:migrate`
# end
