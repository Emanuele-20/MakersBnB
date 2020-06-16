require_relative './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  p "Are we here"
  DatabaseConnection.setup("makersbnb_test")
else
  p "Or here"
  DatabaseConnection.setup("makersbnb")
end