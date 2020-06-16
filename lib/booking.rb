require 'pg'

class Booking
  attr_reader :id, :date, :listingid

  def self.add(id:, date:, listingid:)
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end

    result = @con.exec("INSERT INTO booking (bookingid, date, listingid) 
    VALUES ('#{id}', '#{date}', '#{listingid}')
    RETURNING bookingid, date, listingid;")
    Booking.new(id: result[0]['bookingid'], date: result[0]['date'], listingid: (result[0]['listingid']).to_i)
  end

end
