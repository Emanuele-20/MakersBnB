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

  def self.user_exists?(username)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname:'makersbnb_test')
    else
      con = PG.connect(dbname:'makersbnb')
    end

    users = con.exec('SELECT username FROM users')
    list_of_usernames = users.map { |un| un['username'] }
    list_of_usernames.include?(username)
  end

  def self.find_user(username)
    return false if user_exists?(username) == false
  end



 end
