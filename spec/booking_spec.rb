require 'booking'
require 'listing'
require 'timecop'


describe Booking do

  describe '.find_listing' do
    
    it 'should return the listingid' do
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')

      expect(Booking.find_listing(listing)).to be_kind_of Integer
    end
  end

  # describe ".add" do
  #   it 'should add new booking' do
  #     Timecop.freeze(Time.parse('16 June 2020'))
  #     listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL')


  #     booking = Booking.add(id: 2, date: '16 June 2020', listingid: @listing.id)
  #     expect(Booking).to be Booking
  #     expect(Booking.listingid).to eq listing.id
  #   end
  # end

end
