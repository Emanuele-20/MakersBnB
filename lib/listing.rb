require 'pg'

class Listing

    attr_reader :title, :description, :price, :postcode

   def initialize(title:, description:, price:, postcode:)
    @title = title
    @description = description
    @price = price
    @postcode = postcode
   end

   def self.add(title:, description:, price:, postcode: )
    database_connection

     result = @con.exec("INSERT INTO listing (title, description, price, postcode) 
     VALUES ('#{title}', '#{description}', '#{price}', '#{postcode}') 
     RETURNING title, description, price, postcode;")
     Listing.new(title: result[0]['title'], description: result[0]['description'], price: (result[0]['price']).to_i, postcode: result[0]['postcode'])
   end

   def self.view_all
      database_connection

      result = @con.exec("SELECT * FROM listing;")
      result.map do |entry|
        Listing.new(title: entry['title'], description: entry['description'], price: (entry['price']).to_i, postcode: entry['postcode'])
      end
   end

   private

   def self.database_connection
    if ENV['ENVIRONMENT'] = 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end
   end

end
