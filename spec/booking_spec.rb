require 'booking'
require 'listing'
require 'timecop'


describe Booking do

  describe ".add" do
    it 'should add new booking' do
      Timecop.freeze(Time.parse('16 June 2020'))
      listing = Listing.add(title: 'Test listing', description: 'Amazing place', price: 100, postcode: 'N1 4RL', availability: '[2020-06-16, 2020-06-18)')

      booking = Booking.add(date: '16 June 2020', listingid: listing.id)
      expect(booking).to be_a Booking
      expect(booking.listingid).to eq listing.id
    end
  end

end
