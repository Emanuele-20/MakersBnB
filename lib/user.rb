require 'pg'

class User
  attr_reader :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname:'makersbnb_test')
    else
      con = PG.connect(dbname:'makersbnb')
    end

    result = con.exec(
    "INSERT INTO users (username, email, password) 
    VALUES ('#{username}', '#{email}', '#{password}') 
    RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end