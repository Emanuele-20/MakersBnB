require 'pg'
require 'date'

class Booking
  attr_reader :id, :date, :listingid

  def initialize(id:, date:, listingid:)
    @id = id
    @date = format_date(date)
    @listingid = listingid
  end

  def self.add(date:, listingid:)
    database_connection

    result = @con.exec("INSERT INTO booking (date, listingid) 
    VALUES ('#{date}', '#{listingid}')
    RETURNING bookingid, date, listingid;")
    Booking.new(id: result[0]['bookingid'], date: result[0]['date'], listingid: (result[0]['listingid']).to_i)
  end

  private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end
  end

  def format_date(date)
    DateTime.parse(date).strftime('%d/%m/%Y')
  end

end
