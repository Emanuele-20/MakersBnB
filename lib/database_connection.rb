require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
    p "@@"
    p @connection
  end

  def self.query(sql_query)
    p "hey"
    p @connection
    @connection.exec(sql_query)
  end

end