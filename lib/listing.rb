require 'pg'

class Listing

    attr_reader :id, :title, :description, :price, :postcode

   def initialize(id:, title:, description:, price:, postcode:)
    @id = id.to_i
    @title = title
    @description = description
    @price = price
    @postcode = postcode
   end

   def self.add(title:, description:, price:, postcode:, availability:)
    database_connection

     result = @con.exec("INSERT INTO listing (title, description, price, postcode, availability) 
     VALUES ('#{title}', '#{description}', '#{price}', '#{postcode}', '#{availability}') 
     RETURNING listingid, title, description, price, postcode;")
     Listing.new(id: result[0]['listingid'], title: result[0]['title'], description: result[0]['description'], price: (result[0]['price']).to_i, postcode: result[0]['postcode'])
   end

   def self.view_all
      database_connection

      result = @con.exec("SELECT * FROM listing;")
      result.map do |entry|
        Listing.new(id: entry['listingid'], title: entry['title'], description: entry['description'], price: (entry['price']).to_i, postcode: entry['postcode'])
      end
   end

  def self.edit_listing(listingid:, title:, description:, price:, postcode:)
    database_connection

    result = @con.exec("UPDATE listing
      SET title = '#{title}',
          description = '#{description}',
          price = '#{price}',
          postcode = '#{postcode}'
      WHERE
          listingid = '#{listingid}';")
   end

   def self.delete_listing(listingid:)
    database_connection
    @con.exec("DELETE FROM listing WHERE listingid = '#{listingid.to_i}';")
   end

   def self.check_available_listings(date:)
      database_connection

      result = @con.exec(
      "SELECT * FROM listing 
      WHERE NOT listingid IN
      (SELECT listingid FROM booking WHERE date = '#{date}');")
        @available_properties = result.map do |row|
          Listing.new(id: row['listingid'], title: row['title'], description: row['description'], price: (row['price']).to_i, postcode: row['postcode'])
        end
   end

   def self.available_properties
    @available_properties
   end

   def self.date_format(start:, finish:)
    start_date = DateTime.strptime(start,'%m/%d/%Y')
    end_date = DateTime.strptime(finish,'%m/%d/%Y')
    format_one = start_date.strftime('%Y-%m-%d')
    format_two = end_date.strftime('%Y-%m-%d')
    "[" + format_one + ", " + format_two + ")"
   end

   private

   def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect(dbname: 'makersbnb_test')
    else
     @con = PG.connect(dbname: 'makersbnb')
    end
   end

end
