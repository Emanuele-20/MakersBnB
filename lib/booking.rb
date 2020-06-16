require 'pg'


class Booking

  def self.add(id, date)
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end

    result = @con.exec("INSERT INTO booking (date, listingid) 
    VALUES ('#{title}', '#{description}', '#{price}', '#{postcode}')
    RETURNING title, description, price, postcode;")


  end




end
