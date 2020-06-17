require 'pg'

class Booking
  attr_reader :id, :date, :listingid

  def initialize(id:, date:, listingid:)
    @id = id
    @date = date
    @listingid = listingid
  end
<<<<<<< HEAD
  def self.add(title, date)
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end

    result = @con.exec("INSERT INTO booking (date, title)
    VALUES ('#{date}', '#{listingid}')
    RETURNING title, description, price, postcode;")


  end

end
